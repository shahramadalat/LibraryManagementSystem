   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nulle7clr-namespace:LibraryManagementApplication.Views.Borrow)LibraryManagementApplication.Views.Borrow  5   	   =    7LibraryManagementApplication.Views.Borrow.AddBorrowView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Ilocal7clr-namespace:LibraryManagementApplication.Views.Borrow     5   	   -   5          � Title$  AddBorrowView��5   	   $	��450��6   $	��800��6,    � WindowStartupLocation$ CenterScreen=�5	       � WindowStyle$
 None=�5
   
    � WindowState$ 	Maximized=�5   
    � 	Resources 5       �� 
TargetType �� Property �� Value��%  '��       '�� s     '��     �� 5   
   " ��6   .�5      ��  � ��$ Right=�64   �� 5       � ��$ Center=�62   5      �� 5   
   " ��6   .�5      ��  � ��$
 auto��6&   �� 5       � ��$	 150��6)   67   �� 5       � ��$ 30��6'   5      �� 5   
   " ��6   .�5      ��  � �� �#0066ff6+   �� 5       � ��
 �����6+   �� 5       � ��$ 60��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 10,0,0,0q�6'   5      5      .��5      �  � ColumnDefinitions 5    
   �� 5!      $��9* �6   �� 5"      $
��auto �6   	 � RowDefinitions	 5$   
   �� 5%      �� 5&      $	��10* �6   �� 5'      $
��auto �6   �� 5(      $
��auto �6   .+�5-   
   �� $��29��6   $��0��6!   $��0��6.   
 �� Orientation$
 
Horizontal=�6>   $	��Top=�6W   ���#0066ff.+�5.      �� -   5         ��Name$ lblTitle��5.      $��15(�6&   
�������.��6G   
Add Borrow6S   5/      �� 51   
   $��0��6   ���#0066ff$��1��67   $
 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�52      �� -   5         ��Name$ btnExit��52      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   53      � 56   
   $��1��6   $��2��6   	 57      �� 58      $��* �6    �� 59      $��2* �6    .+�5;      � $��0��6    5<      �� 5=      �� 5>      �� 5?      �� 5@      �� 5A      	 5C      �� 5D      �� 5E      �� 5F      .+�5I      �� $��1��6   .��6(   	Book name63   �� 5J      -   5         ��Name$ txtBookName��5J      ${�False��6/   $��2��6A   6T   �� 5K      -   5        $ btnChooseBook��5K   B   $��0��6   $
��Left=�6&   $��3��6u   $��30��6�   $��90��6�   .��6�   Choose a book6�   �� 5N      $��1��6   $��1��6%   .��65   
Quantity6?   �� 5O      -   5        $ txtQuantity��5O   R   $��1��6E   $��1��6g   $��2��6t   6�   �� 5R      $
 Vertical=�6   $��Center=�64   $��Center=�6Q   $��1��6l   $��3��6y   $��2��6�   $��2��6�   .+�5S      �� $��Right=�6!   $
 
Horizontal=�6=   .+�5T      �� -   5        $ 	txtSearch��5T   "   67   �� 5U      -   5        $ 	btnSearch��5U   9   
�����_�$��10,0,0,0q�6c   $��30��6u   .��6�   Search6�   5V      �� 5W      -	   5        $ 
lblSearchs��5W      $y�	Collapsed=�60   $��Center=�6G   .��6d   31Search based on Fullname, Invoice-id and Bookname6�   5X      �� 5[      $
 Vertical=�6   $��Center=�64   $��Center=�6O   $��2��6l   $��0��6y   $��3��6�   .+�5\      �� $
 
Horizontal=�6!   $��Center=�6:   $��Center=�6W   .+�5]      �� -
   5        $ 	btnInsert��5]   F   $��3��69   
��� � �.��6l   Insert6t   �� 5^      -   5        $ 	btnDelete��5^   F   $��5��69   
���  ��.��6n   Delete6v   �� 5_      -   5        $ 	btnUpdate��5_   ]   $y�	Collapsed=�6!   $��5��6P   .��6q   Update6y   �� 5`      -   5        $ 	btnReturn��5`   x   $y�	Collapsed=�6!   $��5��6P   
����� �.��6�   
Returned6�   �� 5a      -   5        $ btnClear��5a   E   $��6��68   
�����_�.��6n   Clear6u   5b      �� 5c      $��Center=�6!   $��Center=�6>   .+�5d      �� -   5        $ 	lblSearch��5d       $y�	Collapsed=�63   .��6J   '%search based on Fullname and Username6q   5e      5f      5g      &   System.Windows.Controls.DataGrid  5h      -   5          Name$ AccountDatagrid��5j      $��1��5i      ��5k      �� *
accounts+   Columns 5n      0  *System.Windows.Controls.DataGridTextColumn  5o      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6]      MinWidth$	 150Q�6g      Header$ BorrowID��6v   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *
BorrowId+6�     5p      $ 	Collapsed=�6)   $ * 6[   $	 150Q�6e   $ BookId��6t    6@   �� *BookId+6�     5q      $ * 6F   $	 150Q�6P   $ 	Book name��6_    6)   �� *
BookName+6t     5r      $ * 6F   $	 150Q�6P   $ Quantity��6_    6)   �� *
Quantity+6s   5t      5v      �� 5w   
   $��0,0,0,10q�6   $��2��6'   $��Center=�64   $��Center=�6O   $
 
Horizontal=�6l   .+�5x      �� -   5        $ invoice��5x   +   $��90��6<   .��6G   insert invoice6W   �� 5y      $��15,0,0,0q�6   .��6&   Borrow Date:64   (  "System.Windows.Controls.DatePicker  5z      -   5          Name$ txtDate��5z   +   ${�False��6   $��40��6=   $��3��6I   $��2��6W   $��1��6d   6v   �� 5{      -   5        $ btnChoosePerson��5{   5   $��90��6N   .��6Y   Choose person6h   �� 5|      -   5        $ 	txtPerson��5|   :   ${�False��6   $��10,0,0,0q�6(   6O   �� 5}      $��0,0,0,0q�6   .��6%   Invoice Id:62   �� 5~      -   5        $ lblInvoiceId��5~      ${�False��6*   .��6<   66?   5�      �� 5�   
   $��3��6   $��Center=�6"   $
 
Horizontal=�6?   $��Center=�6X   .+�5�      �� $��0,0,0,0q�6   .��6%   Return Date:63     5�      -   5        $ txtReturnDate��5�   ,   ${�False��6   $��40��6D   $��3��6P   $��1��6^   6p   �� 5�      -   5        $ btnDeleteInvoice��5�   K   $y�	Collapsed=�64   
���  ��$��90��6z   .��6�   Delete Invoice6�   5�      5�      5�      