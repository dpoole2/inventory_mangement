class Report < ApplicationRecord



    def self.revenue_report(date_to, date_from)
        items = OrderItem.where("created_at >= ? AND created_at <= ?", date_to, date_from)
        count_hash = {}
        items.each do |item|
            count_hash[item.menu_items_id].present? ? count_hash[item.menu_items_id] += 1 : count_hash[item.menu_items_id] = 1
        end
        workbook = WriteExcel.new('report.xls')
        worksheet  = workbook.add_worksheet
        y_count = 1
        worksheet.write(0, 0, 'Product Name') 
        worksheet.write(0, 1, 'Order Quantity') 
        worksheet.write(0, 2, 'Total')

        count_hash.each do |key, value|
           menu_item = MenuItem.find_by(id: key)
           worksheet.write(y_count, 0, menu_item.name)
           worksheet.write(y_count, 1, value)
           worksheet.write(y_count, 2, menu_item.price * value)
           y_count += 1 #increase the item count
        end

        workbook.close
        Report.create(data: File.read("report.xls"))
        #File.delete("report.xls") if File.exist?("report.xls")




    end
end
