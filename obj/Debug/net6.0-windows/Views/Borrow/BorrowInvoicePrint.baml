   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nulle7clr-namespace:LibraryManagementApplication.Views.Borrow)LibraryManagementApplication.Views.Borrow  5   	   B    <LibraryManagementApplication.Views.Borrow.BorrowInvoicePrint   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Ilocal7clr-namespace:LibraryManagementApplication.Views.Borrow     5   	   -   5          � Title$  BorrowInvoicePrint��5   	   $
��auto��5	   	   $	��816��6    � WindowStartupLocation$ CenterScreen=�5
   	    � WindowStyle$
 None=�5   	    � 	Resources 5       �� 
TargetType �� Property �� Value��%  '��       '�� u     '��     �� 5   
   " ��6   .�5      ��  � ��$ Center=�62   �� 5       � ��$ 18(�6)   66   5      �� 5   
   " ��6   .�5      ��  � ��$
 auto��6&   �� 5       � ��$	 150��6)   67   �� 5       � ��$ 30��6'   5      �� 5   
   " ��6   .�5      ��  � �� �#0066ff6+   �� 5       � ��
 �����6+   �� 5       � ��$ 60��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 10,0,0,0q�6'   5      5      .��5       � $
��True��6    � ColumnDefinitions 5!   
   �� 5"      $��* �6   �� 5#      $
��auto �6    � RowDefinitions 5%   
   �� 5&      $
��auto �6   �� 5'      $
��auto �6   .+�5)   
   �� $��29��6   $��0��6!   	 �� Orientation$	 
Horizontal=�6/   $	��Top=�6H   ���#0066ff.+�5*      �� $��15(�6   
�������.��65   Borrow Invoice Print6K   5+      �� 5,   
   $��0��6   ���#0066ff$��1��67   $	 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�5-      �� -   5        
 ��Name$
 btnPrint��5-      ���#0066ff$��0q�6T   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   Print6�   �� 5.      -   5        $
 btnExit��5.      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   5/      �� 51   
   -   5         ��Name$ 
stackPrint��51       �� CanVerticallyScroll$
 True��6)    �� CanHorizontallyScroll$
 True��6D   $	��900��6a   $	��750��6n   $��2��6z   $��0��6�   $��1��6�   $	 Vertical=�6�   $��10q�6�   .+�52      �� $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�53      �� .��6   Borrow Invoice Id:6,   �� 54      -   5         ��Name$ lblInvoiceId��54      .��6.   661   55      �� 56      $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�57      �� .��6   Borrow Date:6&   �� 58      -   5        $ lblDate��58      .��6)   20-200-200066   59      �� 5:      $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�5;      �� .��6   Return Date:6&   �� 5<      -   5        $ lblReturnDate��5<      .��6/   20-200-20006<   5=      �� 5>      $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�5?      �� .��6   	Person:6!   �� 5@      -   5        $ 	lblPerson��5@      .��6+   ahmed62   5A      �� 5B      $	 
Horizontal=�6   $��Center=�62   $��Center=�6M   .+�5C      �� .��6   Employee Id:6&   �� 5D      -	   5        $ lblAccountId��5D      .��6.   661   5E      &   System.Windows.Controls.DataGrid  5F      -
   5          Name$ AccountDatagrid��5G      ��5H      �� *
accounts+   Columns 5J      0  *System.Windows.Controls.DataGridTextColumn  5K      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6]      MinWidth$	 150Q�6g      Header$ LibraryNoteId��6v   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *
BorrowId+6�     5L      $ 	Collapsed=�6)   $ * 6[   $	 150Q�6e   $ BookId��6t    6@   �� *BookId+6�     5M      $ * 6F   $	 150Q�6P   $ 	Book name��6_    6)   �� *
BookName+6t     5N      $ * 6F   $	 150Q�6P   $ Quantity��6_    6)   �� *
Quantity+6s   5P      5R      5S      5T      