defmodule Comeonin.BcryptTest do
  use ExUnit.Case

  alias Comeonin.Bcrypt

  test "output of bf_init" do
    salt1 = [43, 72, 170, 81, 102, 79, 125, 79, 15, 10, 34, 85, 76, 104, 197, 190]
    salt2 = [249, 196, 216, 206, 68, 222, 11, 105, 137, 241, 188, 68, 185, 78, 14, 64]
    salt3 = [215, 140, 191, 62, 162, 63, 189, 155, 92, 3, 201, 135, 113, 27, 113, 53]
    test1 = Bcrypt.bf_init('password', 9, salt1) |> :erlang.binary_to_list
    test2 = Bcrypt.bf_init('averylongpasswordthisis', 23, salt2) |> :erlang.binary_to_list
    test3 = Bcrypt.bf_init('hard2guess', 10, salt3) |> :erlang.binary_to_list
    start1 = [206, 27, 22, 50, 221, 128, 113, 12, 178, 234, 219, 243, 197, 204, 180, 43, 83,
      79, 199, 152, 160, 179, 73, 87, 208, 195, 125, 200, 2, 254, 52, 249, 208, 229,
      190, 124, 114, 222, 154, 201, 179, 136, 227, 161, 142, 135, 184, 237, 60, 145]
    start2 = [218, 186, 228, 242, 86, 145, 106, 80, 36, 135, 160, 211, 158, 70, 245, 50, 111,
      230, 237, 64, 248, 175, 33, 184, 104, 81, 79, 145, 200, 122, 36, 108, 82, 62,
      255, 185, 98, 95, 128, 204, 60, 37, 71, 158, 66, 180, 52, 153, 128, 246]
    start3 = [137, 141, 101, 133, 184, 66, 194, 122, 108, 248, 120, 172, 218, 140, 226, 93,
      132, 54, 235, 228, 195, 17, 243, 43, 164, 219, 186, 212, 35, 121, 255, 62, 167,
      245, 189, 139, 105, 236, 123, 45, 232, 197, 241, 249, 10, 244, 1, 87, 69]
    ending1 = [61, 128, 168, 16, 229, 16, 181, 145, 75, 250, 3, 158, 164, 172, 225, 44, 74,
      255, 104, 248, 151, 195, 197, 215, 79, 213, 67, 252, 162, 83, 87, 156, 94, 218,
      209, 48, 153, 225, 12, 183, 138, 159, 38, 12, 189, 135, 59, 200, 59, 23]
    ending2 = [93, 131, 37, 206, 209, 55, 29, 39, 144, 20, 219, 134, 129, 213, 124, 32, 138,
      204, 83, 242, 6, 76, 144, 241, 207, 240, 215, 151, 216, 114, 106, 183, 87, 27,
      228, 217, 135, 212, 16, 29, 220, 92, 27, 41, 38, 53, 43, 187, 144, 67]
    ending3 = [183, 250, 228, 249, 181, 153, 111, 176, 108, 93, 145, 90, 4, 64, 18, 252, 81,
      38, 230, 243, 55, 48, 239, 233, 224, 70, 230, 19, 127, 97, 187, 57, 187, 122,
      141, 159, 73, 232, 16, 214, 42, 254, 11, 246, 175, 44, 139, 166, 72, 119]
    assert :lists.prefix(start1, test1)
    assert :lists.suffix(ending1, test1)
    assert :lists.prefix(start2, test2)
    assert :lists.suffix(ending2, test2)
    assert :lists.prefix(start3, test3)
    assert :lists.suffix(ending3, test3)
  end

end
