   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullk:clr-namespace:LibraryManagementApplication.Views.Libraries,LibraryManagementApplication.Views.Libraries  5   	   A    ;LibraryManagementApplication.Views.Libraries.LibraryInvoice   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Llocal:clr-namespace:LibraryManagementApplication.Views.Libraries     5   	   -   5          � Title$  LibraryInvoice��5   	   $	��450��6    $	��800��6-    � WindowStartupLocation$ CenterScreen=�5	   	    � WindowStyle$
 None=�5
   	    � WindowState$ 	Maximized=�5   	    � 	Resources 5       �� 
TargetType �� Property �� Value��%  '��       '�� s     '��     �� 5   
   " ��6   .�5      ��  � ��$ Right=�64   �� 5       � ��$ Center=�62   5      �� 5   
   " ��6   .�5      ��  � ��$
 auto��6&   �� 5       � ��$	 150��6)   67   �� 5       � ��$ 30��6'   5      �� 5   
   " ��6   .�5      ��  � �� �#0066ff6+   �� 5       � ��
 �����6+   �� 5       � ��$ 60��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 10,0,0,0q�6'   5      5      .��5      �  � ColumnDefinitions 5    
   �� 5!      $��9* �6   �� 5"      $
��auto �6   	 � RowDefinitions	 5$   
   �� 5%      �� 5&      $	��10* �6   �� 5'      .+�5,   
   �� $��29��6   $��0��6!   $��0��6.   
 �� Orientation$
 
Horizontal=�6>   $	��Top=�6W   ���#0066ff.+�5-      �� $��15(�6   
�������.��65   	Library6>   5.      �� 50   
   $��0��6   ���#0066ff$��1��67   $
 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�52      �� -   5         ��Name$ btnExit��52      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   53      � 56   
   $��1��6   $��2��6   	 57      �� 58      $��* �6    �� 59      $��2* �6    .+�5;      � $��0��6    5<      �� 5=      �� 5>      �� 5?      �� 5@      �� 5A      	 5C      �� 5D      �� 5E      �� 5F      .+�5I      �� .��6   	Book name6$   �� 5J      -   5         ��Name$ txtBookName��5J      ${�False��6/   $��1��6A   6T   �� 5K      -   5        $ btnChooseBook��5K   B   $��0��6   $
��Left=�6&   $��2��6u   $��30��6�   $��90��6�   .��6�   Choose a book6�   �� 5N      $��0��6   $��3��6%   $��15,0,0,0q�65   .��6G   Income Date:6U   (  "System.Windows.Controls.DatePicker  5O      -   5          Name$ txtDate��5O      $��40��6/   $��3��6;   $��0��6I   $��4��6V   6h   �� 5R      $��1��6   $��3��6%   .��65   
Invoice Id6A   �� 5S      -   5        $ txtInvoiceId��5S   R   $��2��6E   $��1��6h   $��4��6u   6�   �� 5V      $��1��6   $��0��6%   .��65   
Quantity6?   �� 5W      -   5        $ txtQuantity��5W   R   $��1��6E   $��1��6g   $��1��6t   6�   �� 5Z      $��2��6   $��0��6%   .��65   
Book price6A   �� 5[      -   5        $ txtPrice��5[   R   $��2��6E   $��2��6d   $��1��6q   6�   �� 5^      $
 Vertical=�6   $��Center=�64   $��Center=�6O   $��2��6l   $��2��6y   $��3��6�   .+�5_      �� $
 
Horizontal=�6!   $��Center=�6:   $��Center=�6W   .+�5`      �� -	   5        $ 	btnInsert��5`   F   $��3��69   
��� � �.��6l   Insert6t   �� 5a      -
   5        $ 	btnUpdate��5a   F   $��4��69   .��6Y   Update6a   �� 5b      -   5        $ btnUpdateInvoice��5b   X   $��90��6!   $��4��6K   .��6r   Update Invoice6�   �� 5c      -   5        $ 	btnDelete��5c   F   $��5��69   
���  ��.��6n   Delete6v   �� 5d      -   5        $ 	btnSearch��5d   F   $��6��69   
�����_�.��6p   Search6x   �� 5e      -   5        $ btnClear��5e   E   $��6��68   
�����_�.��6n   Clear6u   5f      �� 5g      $��Center=�6!   $��Center=�6>   .+�5h      �� -   5         ��Name$ 	lblSearch��5h       $y�	Collapsed=�63   .��6J   0.search based on Invoice-Id, book-name and date6z   5i      5j      5k      &   System.Windows.Controls.DataGrid  5l      -   5          Name$ AccountDatagrid��5n      $��1��5m      ��5o      �� *
accounts+   Columns 5r      0  *System.Windows.Controls.DataGridTextColumn  5s      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6^      MinWidth$	 150Q�6h      Header$ LibraryNoteId��6w   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *	LibraryId+6�     5t      $ Visible=�6)   $ * 6c   $	 150Q�6m   $ 
Invoice Id��6|    6>   �� *LibraryInvoiceId+6�     5u      $ 	Collapsed=�6)   $ * 6[   $	 150Q�6e   $ BookId��6t    6@   �� *BookId+6�     5v      $ * 6F   $	 150Q�6P   $ 	Book name��6_    6)   �� *
BookName+6t     5w      $ * 6F   $	 150Q�6P   $ Quantity��6_    6)   �� *
Quantity+6s     5x      $ * 6G   $	 150Q�6Q   $ Price��6`    6)   �� *	BookPrice+6q     5y      $ * 6C   $	 150Q�6M   $ Total��6\    6)   �� *Total+6m     5z      $ * 6B   $	 150Q�6L   $
 Date��6[    6)   �� *Date+6k     5{      $ * 6F   $	 150Q�6P   $ Account��6_    6)   �� *
FullName+6r   5}      5~      �� 5   
   $��2��6   $��Center=�6"   $��Center=�6=   $
 
Horizontal=�6Z   .+�5�      �� -   5        $ 	btnChoose��5�   D   $y�	Collapsed=�6   $��90��6W   .��6b   Choose6j   5�      5�      5�      