   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:LibraryManagementApplicationLibraryManagementApplication  5   	   '    !LibraryManagementApplication.Home   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   <local*clr-namespace:LibraryManagementApplication     5   	     � Title$
  Home��5   	   $	��450��6   $	��800��6#    � WindowStartupLocation$ CenterScreen=�5	   
    � WindowStyle$
 None=�5
   
    � WindowState$ 	Maximized=�5   
   .��5      �  � ColumnDefinitions 5   
   �� 5      $��9* �6   �� 5      $
��auto �6    � RowDefinitions 5   
   �� 5      �� 5      $��5* �6   �� 5      .+�5   
   �� $��0��6   $��0��6"    �� Orientation$ 
Horizontal=�62   $	��Top=�6K   ���#0066ff.+�5      �� $��14(�6   
�������.��66   
User ID:6@   �� 5      -   5         ��Name$ 	lblUserID��5      $��14(�6'   
�������6J   �� 5      $��15,0,0,0q�6   $��14(�6&   
�������.��6G   	Fullname:6R   �� 5      -   5        $ lblFullname��5      $��14(�6)   
�������6L   �� 5      $��15,0,0,0q�6   $��14(�6&   
�������.��6G   Permission:6U   �� 5      -   5        $ lblPermission��5      $��14(�6,   
�������6O   5      �� 5    
   $��0��6   ���#0066ff$��1��67   $ 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�5!      �� -   5         ��Name$ 
btnSetting��5!      $��0q�6B   
������ 
�������$��0,0,10,0q�6�   $��10(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   	Setting6�   �� 5"      -   5        $ btnMinimized��5"      $��0q�6F   
������ 
�������$��0,0,10,0q�6�   $��20(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   -6�   �� 5#      -   5        $ btnExit��5#      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   5$      �� 5%   
   $��Center=�6   $��Center=�60   $ Vertical=�6M   $��1��6d   $��2��6q   .+�5&      �� $ 
Horizontal=�6   .+�5'      �� -   5        $ 
btnAccount��5'      $��15(�6F   ���#006699
�������$	��110��6|   $	��120��6�   .��6�   	Account6�   �� 5(      -   5        $ btnBooks��5(      $��15(�6B   ���#006699
�������$	��110��6x   $	��120��6�   .��6�   Books6�   �� 5)      -	   5        $ 
btnLibrary��5)      $��15(�6F   ���#006699
�������$	��110��6|   $	��120��6�   .��6�   	Library6�   �� 5*      -
   5        $ 	btnPerson��5*      $��15(�6D   ���#006699
�������$	��110��6z   $	��120��6�   .��6�   Person6�   �� 5+      -   5        $ 	btnBorrow��5+      $��15(�6D   ���#006699
�������$	��110��6z   $	��120��6�   .��6�   Borrow6�   5,      5-      5/      50      