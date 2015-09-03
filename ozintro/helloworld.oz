functor
import
   Application
   System
define
   {System.showInfo 'Hello World!'}
   for X in 1..10 do {System.showInfo X} end
   {Application.exit 0}
end