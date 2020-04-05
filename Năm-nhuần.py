#print("Chương trình một tháng có bao nhiêu ngày?")
print("Chương trình một tháng có bao nhiêu ngày?")
month=int(input("Mời nhập 1 tháng bất kỳ:"))
if month in (1,3,5,7,8,10,12):
    print("Tháng",month,"có 31 ngày")
elif month in (4,6,9,11):
    print("Tháng", month, "có 30 ngày")
elif month==2:
    year=int(input("Mời nhập năm của tháng:"))
    if (year % 4 == 0 and year % 100 != 0) or year % 400 == 0:
        print("Tháng", month,"năm", year, "có 29 ngày")
    else:
        print("Tháng", month,"năm", year, "có 29 ngày")
else:
    print("Tháng không hợp lệ")