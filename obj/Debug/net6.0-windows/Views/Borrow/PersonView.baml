   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nulle7clr-namespace:LibraryManagementApplication.Views.Borrow)LibraryManagementApplication.Views.Borrow  5   	   :    4LibraryManagementApplication.Views.Borrow.PersonView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Ilocal7clr-namespace:LibraryManagementApplication.Views.Borrow     5   	   -   5          � Title$  
PersonView��5   	   $	��450��6   $	��800��6)    � WindowStartupLocation$ CenterScreen=�5	       � WindowStyle$
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
   �� 5%      �� 5&      $	��10* �6   �� 5'      .+�5,   
   �� $��29��6   $��0��6!   $��0��6.   
 �� Orientation$
 
Horizontal=�6>   $	��Top=�6W   ���#0066ff.+�5-      �� $��15(�6   
�������.��65   Person6=   5.      �� 50   
   $��0��6   ���#0066ff$��1��67   $
 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�52      �� -   5         ��Name$ btnExit��52      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   53      � 56   
   $��1��6   $��2��6   	 57      �� 58      $��* �6    �� 59      $��2* �6    .+�5;      � $��0��6    5<      �� 5=      �� 5>      �� 5?      �� 5@      �� 5A      	 5C      �� 5D      �� 5E      �� 5F      .+�5I      �� .��6   
Fullname6#   �� 5J      -   5         ��Name$ txtFullname��5J   '   $��0��6   $��1��6<   6O   �� 5M      $��2��6   .��6(   Gender60   �� 5N      -   5         ��Name$ 	txtGender��5N   (   $��1��6   $��30��6;   $
��auto��6G   $	��150��6T   $��14(�6c   $��0��6q   $��3��6~    �� SelectedIndex$ 0��6�   .@�5O      �� .��6#   Male6)   �� 5P      .��6#   Female6+   5Q      �� 5S      $��1��6   $��0��6%   .��65   Age6:   �� 5T      -   5        $ txtAge��5T   R   $��2��6E   $��1��6b   $��1��6o   6�   �� 5W      $��1��6   $��2��6%   .��65   Phone6<   �� 5X      -   5        $ txtPhone��5X   F   $��1��6X   $��3��6e   $��3��6r   6�   �� 5[      $��2��6   $��0��6%   .��65   	Cart Id6>   �� 5\      -   5        $ txtCart��5\   '   $��4��6   $��2��68   $��1��6E   6W   �� 5^      $
 Vertical=�6   $��Center=�64   $��Center=�6O   $��2��6l   $��2��6y   $��3��6�   .+�5_      �� $
 
Horizontal=�6!   $��Center=�6:   $��Center=�6W   .+�5`      �� -   5        $ 	btnInsert��5`   F   $��5��69   
��� � �.��6l   Insert6t   �� 5a      -	   5        $ 	btnUpdate��5a   F   $��6��69   .��6Y   Update6a   �� 5b      -
   5        $ 	btnDelete��5b   F   $��7��69   
���  ��.��6n   Delete6v   �� 5c      -   5        $ 	btnSearch��5c   F   $��7��69   
�����_�.��6p   Search6x   �� 5d      -   5        $ btnClear��5d   E   $��7��68   
�����_�.��6n   Clear6u   5e      �� 5f      $��Center=�6!   $��Center=�6>   .+�5g      �� -   5         ��Name$ 	lblSearch��5g       $y�	Collapsed=�63   .��6J   *(search based on Fullname, Phone, Cart-id6t   5h      5i      5j      &   System.Windows.Controls.DataGrid  5k      -   5          Name$ AccountDatagrid��5m      $��1��5l      ��5n      �� *
accounts+   Columns 5r      0  *System.Windows.Controls.DataGridTextColumn  5s      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6]      MinWidth$	 150Q�6g      Header$ PersonId��6v   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *
PersonId+6�     5t      $ * 6F   $	 150Q�6P   $ Fullname��6_    6)   �� *
FullName+6s     5u      $ * 6D   $	 150Q�6N   $ Gender��6]    6)   �� *Gender+6o     5v      $ * 6A   $	 150Q�6K   $	 Age��6Z    6)   �� *Age+6i     5w      $ * 6C   $	 150Q�6M   $ Phone��6\    6)   �� *Phone+6m     5x      $ * 6D   $	 150Q�6N   $ Cart Id��6]    6)   �� *CartId+6p   5z      5|      �� 5}   
   $��2��6   $��Center=�6"   $��Center=�6?   .+�5~      �� -   5        $ 	btnChoose��5~   -   $y�	Collapsed=�6@   .��6W   Choose6_   5      5�      5�      