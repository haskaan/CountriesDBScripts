Sub PlateNoSplit()

    Dim x As Long
    Dim numRows As Long
    
    Application.ScreenUpdating = False
    
    ' Set numrows = number of rows of data.
    numRows = Range("D1", Range("D1").End(xlDown)).Rows.Count
    
    
    ' Establish "For" loop to loop "numrows" number of times.
    For x = 2 To numRows
        Cells(x, 1) = Left(Cells(x, 6), 2)
    Next
    
    
    Application.ScreenUpdating = True
    MsgBox "Ýþlem tamamlanmýþtýr."

End Sub
