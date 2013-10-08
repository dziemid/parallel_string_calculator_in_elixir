# Stringcalculator

** TODO: Add description **

Notes:

#create child process
spawn(fn ->
	# i am running as a child
end)

#parent pid
parent_pid = self

#send message
parent_pid <- { :key, value } 

#receive message
 receive do
      {:key, value} ->
        do_sth(value)
 end


+    Enum.map files, do_parallel_process(&1, self)
+    do_collect(length(files), [])
+  end
+
+  defp do_collect(0, acc) do
+    sum_up(acc)
+  end
+
+  defp do_collect(count, acc) do
+    receive do
+      {:sum, sum} ->
+        do_collect(count-1,[sum|acc])
+    end
+  end
+
+  defp do_parallel_process(file_name, parent_pid) do
+    spawn(fn ->
+      sum = add_from_file(file_name)
+      parent_pid <- { :sum, sum }
+    end)
   end

http://elixir-lang.org/docs/master/
https://github.com/adambard/learnxinyminutes-docs/blob/master/elixir.html.markdown

# input |> extract_values 
# Enum.reduce(numbers, 0, fn(x, acc) -> x+acc end)
# Regex.scan(%r/\d+/, input)
# Enum.map(strings, fn(x) -> binary_to_integer(x) end)

