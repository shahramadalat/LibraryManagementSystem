   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullg8clr-namespace:LibraryManagementApplication.Views.Setting*LibraryManagementApplication.Views.Setting  5   	   <    6LibraryManagementApplication.Views.Setting.SettingView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Jlocal8clr-namespace:LibraryManagementApplication.Views.Setting     5   	   -   5          � Title$  SettingView��5   	   $	��450��6   $	��800��6*    � WindowStartupLocation$ CenterScreen=�5	       � WindowStyle$
 None=�5
   	    � WindowState$ 	Maximized=�5   
    � 	Resources 5       �� 
TargetType �� Property �� Value��%  '��       '�� s     '��     �� 5   
   " ��6   .�5      ��  � ��$ Right=�64   �� 5       � ��$ Center=�62   5      �� 5   
   " ��6   .�5      ��  � ��$
 auto��6&   �� 5       � ��$	 150��6)   67   �� 5       � ��$ 30��6'   5      �� 5   
   " ��6   .�5      ��  � �� �#0066ff6+   �� 5       � ��
 �����6+   �� 5       � ��$ 60��6&   �� 5       � ��$ 40��6'   �� 5       � ��$ 10,0,0,0q�6'   5      5      .��5      �  � ColumnDefinitions 5    
   �� 5!      $��9* �6   �� 5"      $
��auto �6   	 � RowDefinitions	 5$   
   �� 5%      �� 5&      $	��10* �6   �� 5'      .+�5*   
   �� $��0��6   ���#0066ff$��1��67   
 �� Orientation$
 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�5+      �� -   5         ��Name$ btnExit��5+      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   5,      �� 5.   
   $��29��6   $��0��6!   $��0��6.   $
 
Horizontal=�6>   $	��Top=�6W   ���#0066ff.+�5/      �� $��15(�6   
�������.��65   	Setting6>   50      �� 52   
   $��1��6   $��Center=�6"   $��Center=�6?   .+�53      �  54      �� 55      �� 56      	 58      �� 59      �� 5:      �� 5;      .+�5>      �� $��0,0,0,10q�6   $��0��6*   $��0��67   .��6G   Books Borrow Limit6[   �� 5?      -   5         ��Name$ txtBooksLimit��5?   X   $��0,0,0,10q�6F   $��1��6o   $��0��6   6�   �� 5@      $��1��6   $��0��6%   .��65   Books return Date Limit6N   �� 5A      -   5        $ txtReturndate��5A   E   $��1��6\   $��1��6l   6{   �� 5B      -   5        $ btnSave��5B      $��0,10,0,0q�6@   $��2��6R   $��2��6_   .��6s   Save6y   5C      5D      5F      5G      