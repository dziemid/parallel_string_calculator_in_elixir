  defmodule StringCalculator do

    def add_from_directory(directory_name) do
      files = Path.wildcard(Path.join(directory_name, "*"))
      Enum.map files, &do_parallel_process(&1, self)
      do_collect(length(files), [])
    end

    def add_from_file(file_name) do
      case File.read(file_name) do
        { :ok, contents }  ->
          add(contents)
      end
    end

    def add(input) do
      Regex.scan(%r{[0-9]+}, input) |> List.flatten |> Enum.map(&to_int(&1))  |> sum_up
    end

    defp do_parallel_process(file_name, parent_pid) do
      spawn(fn ->
        sum = add_from_file(file_name)
        parent_pid <- { :sum, sum }
        end)
    end

    defp do_collect(0, acc) do
      sum_up(acc)
    end

    defp do_collect(count, acc) do
      receive do
        {:sum, sum} ->
          do_collect(count-1,[sum|acc])
      end
    end

    defp to_int(s) do
      {i,_} = String.to_integer(s)
      i
    end
    
    defp sum_up(numbers) do
      Enum.reduce(numbers, 0, fn(x, acc) -> x+acc end) 
    end

  end

