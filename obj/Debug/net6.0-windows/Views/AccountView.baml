   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullW0clr-namespace:LibraryManagementApplication.Views"LibraryManagementApplication.Views  5   	   4    .LibraryManagementApplication.Views.AccountView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Blocal0clr-namespace:LibraryManagementApplication.Views     5   	   -   5          � Title$  AccountView��5   	   $	��450��6   $	��800��6*    � WindowStartupLocation$ CenterScreen=�5	   
    � WindowStyle$
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
�������.��65   	Account6>   5.      �� 50   
   $��0��6   ���#0066ff$��1��67   $
 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�52      �� -   5         ��Name$ btnExit��52      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   53      � 56   
   $��1��6   $��2��6   	 57      �� 58      $��* �6$   �� 59      $��2* �6$   .+�5;      � $��0��6    5<      �� 5=      �� 5>      �� 5?      �� 5@      �� 5A      	 5C      �� 5D      �� 5E      �� 5F      .+�5I      �� .��6   
Fullname6#   �� 5J      -   5         ��Name$ txtFullname��5J   '   $��0��6   $��1��6<   6O   �� 5M      $��2��6   .��6(   
Username62   �� 5N      -   5        $ txtUser��5N   '   $��1��6   $��3��68   6K   �� 5Q      $��1��6   $��0��6%   .��65   
Password6?   �� 5R      -   5        $ txtPass��5R   '   $��2��6   $��1��68   $��1��6E   6X   �� 5U      $��1��6   $��2��6%   .��65   
Permission6A   �� 5V      -   5         ��Name$ txtPermission��5V   (   $��3��6   $��30��6?   $
��auto��6K   $	��150��6X   $��14(�6g   $��1��6u   $��3��6�    �� SelectedIndex$ 1��6�   .@�5W      �� .��6#   admin6*   �� 5X      .��6#   
employee6-   �� 5Y      .��6#   user6)   5Z      �� 5]      $��2��6   $��0��6%   .��65   Recovery Phrase6F   �� 5^      -   5        $ txtRecovery��5^   '   $��4��6   $��2��6<   $��1��6I   6[   �� 5`      $
 Vertical=�6   $��Center=�64   $��Center=�6O   $��2��6l   $��2��6y   $��3��6�   .+�5a      �� $
 
Horizontal=�6!   $��Center=�6:   $��Center=�6W   .+�5b      �� -   5        $ 	btnInsert��5b   F   $��5��69   
��� � �.��6l   Insert6t   �� 5c      -	   5        $ 	btnUpdate��5c   F   $��6��69   .��6Y   Update6a   �� 5d      -
   5        $ 	btnDelete��5d   F   $��7��69   
���  ��.��6n   Delete6v   �� 5e      -   5        $ 	btnSearch��5e   F   $��7��69   
�����_�.��6p   Search6x   �� 5f      -   5        $ btnClear��5f   E   $��7��68   
�����_�.��6n   Clear6u   5g      �� 5h      $��Center=�6!   $��Center=�6>   .+�5i      �� -   5         ��Name$ 	lblSearch��5i      $y�	Collapsed=�6/   .��6F   '%search based on Fullname and Username6m   5j      5k      5l      &   System.Windows.Controls.DataGrid  5m      -   5          Name$ AccountDatagrid��5o      $��1��5n      ��5p      �� *
accounts+   Columns 5t      0  *System.Windows.Controls.DataGridTextColumn  5u      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6^      MinWidth$	 150Q�6h      Header$ 	AccountId��6w   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *	AccountId+6�     5v      $ * 6F   $	 150Q�6P   $ Fullname��6_    6)   �� *
Fullname+6s     5w      $ * 6J   $	 150Q�6T   $ Username��6c    6-   �� *
Username+6w     5x      $ * 6J   $	 150Q�6T   $ Password��6c    6-   �� *
Password+6w     5y      $ * 6L   $	 150Q�6V   $ 
Permission��6e    6-   �� *
Permission+6{     5z      $ * 6P   $	 150Q�6Z   $ Recovery Phrase��6i    6-   �� *RecoveryPhrase+6�   5|      5~      5�      5�      