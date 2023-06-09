! Project Euler #017
! No of letters used when all 1-1000 are written in words (British English)

function below100(n) result(length)
  implicit none
  integer :: proper(0:19) = [0, 3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8]
  integer :: tenth(9) = [6, 6, 5, 5, 5, 7, 6, 6, 0]
  integer, intent(in) :: n
  integer :: length

  if (n < 20) then
    length = proper(n)
  else
    length = tenth(n / 10 - 1) + proper(mod(n, 10))
    ! 35 / 10 = 3 | 3 - 1 = 2 | tenth(2) = 6
  end if

end function below100

function numberLen(n) result(length)
  implicit none
  integer, intent(in) :: n
  integer :: proper(9) = [3, 3, 5, 4, 4, 3, 5, 5, 4]
  integer :: length, hold
  integer :: below100

  if (n<100) then
    length = below100(n)
  else
    ! two digits + "hundred"
    length = below100(mod(n, 100)) + 7
    hold = n / 100
    if (hold > 0) then
      length = length + proper(hold)
    end if
  end if

  if (n > 100) then
    if (mod(n, 100) > 0) then
      length = length + 3 ! "and"
    end if
  end if

end function numberLen


program ProjectEuler017
  implicit none
  integer :: i,sum
  integer :: below100, numberLen

  sum = 0

  do i = 1, 999
    sum = sum + numberLen(i)
    if (mod(i, 15) == 0) then
      print *, i, numberLen(i)
    end if
  end do

  sum = sum + 11 ! +  "one thousand"

  print *, sum
end program ProjectEuler017