Code.require_file "test_helper.exs", __DIR__

defmodule StringcalculatorTest do
  use ExUnit.Case

  test "it add strings in file" do
    assert StringCalculator.add_from_file("./data/xaa") == 14744908790
  end

  test "it add strings in files in directory" do
    assert StringCalculator.add_from_directory("./data") == 45395714941
  end

  test "return zero for empty string" do
    assert StringCalculator.add("") == 0
  end

  test "sum of one number is itself" do
    assert StringCalculator.add("42") == 42
  end

  test "sum of two numbers is the sum" do
    assert StringCalculator.add("42,43") == 85
  end

  test "handles new lines as separator" do
    assert StringCalculator.add("42\n43") == 85
  end

  test "handles custom separators" do
      assert StringCalculator.add("//{\n13{22\n3") == 38
  end

end
