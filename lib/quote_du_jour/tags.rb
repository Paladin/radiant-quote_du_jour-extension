module QuoteDuJour::Tags
  include Radiant::Taggable

  desc %{
    Renders a random quote from the quotes table.  If the author attribute is included,
    then the random quote will be selected from those available by that author.
    
    *Usage*:

    <pre><code><r:quote [author="author_name" all="true"] /></code></pre>
  }
  tag "quote" do |tag|
    quote = Quote.random(tag.attr['author'])
    result = QuoteDuJour.formatted( quote )
  end
  
  desc %{
    Renders all the quotes.  If the author attribute is included,
    then only the quotes from that author will be rendered.
    
    *Usage*:

    <pre><code><r:quotes [author="author_name"] /></code></pre>
  }
  tag "quotes" do |tag|
    quotes = Quote.list( tag.attr['author'] )
    result = QuoyeDuJour.header( tag.attr['author'] )
    quotes.each do |quote|
      result += QuoteDuJour.formatted( quote )
    end
    result
  end
  
  def QuoteDuJour.header( author )
  	author.blank? ? "<h2>All Quotes</h2>" : "<h2>Quotes by #{author}</h2>"
  end
  
  def QuoteDuJour.formatted( quote )
    result =''
    result << '<blockquote>' + quote.quote
    result << "<br /><br /><cite>&nbsp;&mdash;&nbsp;" + quote.author
    result << " in " + quote.work unless quote.work == ""
    result << '</cite></blockquote>'  
  end
  
end