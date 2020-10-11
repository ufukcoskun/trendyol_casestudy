class Campaign

  def first_campaign
    element = '.component-list.component-big-list>.component-item:nth-of-type(1)'
    return  element
  end

  def all_products
    element = '.products'
    return element
  end

  def first_product
    element = '.products>.boutique-product:nth-of-type(1)'
    return element
  end

  def add_to_basket
    element = '.add-to-bs'
    return element
  end

  def basket_preview
    element = "//*[@id='basketPreviewcontent' and @style='display: block;']"
    return element
  end

end