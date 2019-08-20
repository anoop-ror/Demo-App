class Product < ApplicationRecord
    mount_uploader :pimage, PimageUploader
    
end
