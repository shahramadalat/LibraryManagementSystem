   M S B A M L   `   `   `  ����W  SLibraryManagementApplication, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullc6clr-namespace:LibraryManagementApplication.Views.Books(LibraryManagementApplication.Views.Books  5   	   ;    5LibraryManagementApplication.Views.Books.LanguageView   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Hlocal6clr-namespace:LibraryManagementApplication.Views.Books     5   	   -   5          � Title$  LanguageView��5   	   $	��450��6   $	��800��6+    � WindowStartupLocation$ CenterScreen=�5	   	    � WindowStyle$
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
�������.��65   
Language6?   5.      �� 50   
   $��0��6   ���#0066ff$��1��67   $
 
Horizontal=�6G   $	��Top=�6`   $��Right=�6x   .+�52      �� -   5         ��Name$ btnExit��52      ���#0066ff$��0q�6R   
������ 
�������$��0,0,10,0q�6�   $��15(�6�   $��40��6�   $��29��6�   $��Microsoft JhengHei UI)�6�   .��6�   X6�   53      � 56   
   $��1��6   $��2��6   	 57      �� 58      $��* �6    �� 59      $��2* �6    .+�5;      � $��0��6    5<      �� 5=      �� 5>      �� 5?      �� 5@      �� 5A      	 5C      �� 5D      �� 5E      .+�5K      �� $��0��6   $��1��6*   $��3��6:   $
 
Horizontal=�6N   $��Center=�6g   $��Center=�6�   .+�5L      �� .��6   
Language6#   �� 5M      -   5         ��Name$ txtLanguage��5M   '   $��0��6   $��1��6<   6O   5N      �� 5O      $
 Vertical=�6   $��Center=�64   $��Center=�6O   $��1��6l   $��1��6y   $��3��6�   .+�5P      �� $
 
Horizontal=�6!   $��Center=�6:   $��Center=�6W   .+�5Q      �� -   5        $ 	btnInsert��5Q   F   $��6��69   
��� � �.��6l   Insert6t   �� 5R      -   5        $ 	btnUpdate��5R   F   $��7��69   .��6Y   Update6a   �� 5S      -   5        $ 	btnDelete��5S   F   $��8��69   
���  ��.��6n   Delete6v   �� 5T      -   5        $ 	btnSearch��5T   F   $��9��69   
�����_�.��6p   Search6x   �� 5U      -   5        $ btnClear��5U   F   $��10��68   
�����_�.��6o   Clear6v   5V      �� 5W      $��Center=�6!   $��Center=�6>   .+�5X      �� -	   5         ��Name$ 	lblSearch��5X       $y�	Collapsed=�63   .��6J   search based on Language6d   5Y      5Z      5[      &   System.Windows.Controls.DataGrid  5\      -
   5          Name$ AccountDatagrid��5^      $��1��5]      ��5_      �� *
accounts+   Columns 5c      0  *System.Windows.Controls.DataGridTextColumn  5d      ,  &System.Windows.Controls.DataGridColumn   
Visibility$ 	Collapsed=�6)      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6_      MinWidth$	 150Q�6i      Header$ 	AccountId��6x   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6@   �� *
LanguageId+6�     5e      $ * 6J   $	 150Q�6T   $ Language��6c    6)   �� *LanguageName+6w   5g      �� 5h      $��2��6   $��0��6&   $
 
Horizontal=�66   $��Center=�6O   $��Bottom=�6l   .+�5i      �� -   5        $ 	btnChoose��5i      .��6D   Choose6L   5j      5k      5o      5p      