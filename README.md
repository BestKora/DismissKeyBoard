# DismissKeyBoard
Дополнение к лекции 8 CS193P Stanford Winter 2015

Рассматриваются варианты "скрытия" клавиатуры при работе с текстовым полем типа UITextField

1. Не требующие использования outlets и методов делегата UITextFieldDelegate
2. Использующие метод textFieldShouldReturn делегата UITextFieldDelegate 
   для "скрытия" клавиатуры при нажатии клавиши Return
