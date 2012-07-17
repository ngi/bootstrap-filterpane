package org.lono.date

import org.springframework.web.servlet.support.RequestContextUtils

/**
 * @author ngi
 *
 * TagLib per gli input
 *
 * Created on May 14, 2012
 *
 * @version 0.1 
 * @since 0.1
 */

class DateTagLib {

	static namespace = "lono"

	/**
	 * Genera un campo di input gestito con datepicker di jquery-ui.
	 *
	 * @attr name REQUIRED il name del campo di input
	 * @attr default il valore di default
	 * @attr id l'id del campo di input
	 * @attr minDate il primo giorno selezionabile
	 * @attr value la data corrente
	 */
	def jqDatePicker = {attrs, body ->
		def out = out // let x = x ?

		def label = attrs.'label'
		Boolean inline = Boolean.valueOf(attrs.remove('inline'))
		if (inline == null || !(inline instanceof Boolean || inline?.class == boolean.class)) inline = false
		Boolean changeMonth = Boolean.valueOf(attrs.remove('changeMonth'))
		if (changeMonth == null || !(changeMonth instanceof Boolean || changeMonth?.class == boolean.class)) changeMonth = true
		Boolean changeYear = Boolean.valueOf(attrs.remove('changeYear'))
		if (changeYear == null || !(changeYear instanceof Boolean || changeYear?.class == boolean.class)) changeYear = true
		Boolean showButtonPanel = Boolean.valueOf(attrs.remove('showButtonPanel'))
		if (showButtonPanel == null || !(showButtonPanel instanceof Boolean || showButtonPanel?.class == boolean.class)) showButtonPanel = true

		def xdefault = attrs['default']
		if (xdefault == null) {
			xdefault = new Date()
		}
		if (xdefault.toString() != 'none') {
			if (xdefault instanceof String) {
				xdefault = DateFormat.getInstance().parse(xdefault)
			}
			else if (!(xdefault instanceof Date)) {
				throwTagError("Tag [jqDatePicker] requires the default date to be a parseable String or a Date")
			}
		}
		else {
			xdefault = null
		}

		def value = attrs.value
		if (value.toString() == 'none') {
			value = null
		} else if (!value) {
			value = xdefault
		}
		def name = attrs.name
		if (!name)
			throwTagError("Tag [jqDatePicker] requires the name attribute")

		def id = attrs.id ?: name

		def minDate = attrs['minDate']
		def showDay = attrs['showDay']

		def day
		def month
		def year
		def c = null

		if (value instanceof Calendar) {
			c = value
		} else if (value) {
			c = new GregorianCalendar()
			c.setTime(value)
		}
		if (c != null) {
			day = c.get(GregorianCalendar.DAY_OF_MONTH)
			month = c.get(GregorianCalendar.MONTH) + 1
			year = c.get(GregorianCalendar.YEAR)
		}

		def locale = RequestContextUtils.getLocale(request)?:Locale.US


		//Creo il campo di testo per la data e i campi nascosti previsti da grails
		if (!inline) {
			out << """<input type="text" name="${name}_vis" id="${id}_vis" class="span2" value="" ${attrs.disabled?"disabled":""}/>"""
		} else {
			out << """
			   <div id="${id}" value=""></div>
		   """
		}
		out <<  """
		   <input type="hidden" name="${name}" id="${id}" value="date.struct" />
		   <input type="hidden" name="${name}_day" id="${id}_day" value="${day}" />
		   <input type="hidden" name="${name}_month" id="${id}_month" value="${month}" />
		   <input type="hidden" name="${name}_year" id="${id}_year" value="${year}" />
		   """

		//Codice per parsare la data selezionata e inserirla nei campi nascosti previsti da grails
		if (!(id =~ /\[_clone\]/)) {
			def jquerySelector = id.replaceAll(/(\[)/, '\\\\\\\\$1').replaceAll(/(\])/, '\\\\\\\\$1').replaceAll(/(\.)/, '\\\\\\\\$1')
			def sb = new StringBuffer()
			sb << """

		  \$.datepicker.setDefaults( \$.datepicker.regional[ '${locale.language}'] );
		  \$("#${jquerySelector}_vis").datepicker({
			 onSelect: function(dateText, inst) {
					  try{
				   var date = \$.datepicker.parseDate(\$(this).datepicker('option', 'dateFormat'), dateText);
				   \$("#${jquerySelector}_month").attr("value",date.getMonth() +1);
				   \$("#${jquerySelector}_day").attr("value",date.getDate());
				   \$("#${jquerySelector}_year").attr("value",date.getFullYear());
				}
				catch(error){
				   \$("#${jquerySelector}_month").attr("value","");
				   \$("#${jquerySelector}_day").attr("value","");
				   \$("#${jquerySelector}_year").attr("value","");
				}
			 },
		 changeMonth: ${changeMonth},
		 changeYear: ${changeYear},
		 showButtonPanel: ${showButtonPanel}
	  """

			//inposto il primo giorno selezionabile
			if(minDate != null){
				def mc = null
				if (minDate instanceof Calendar) {
					mc = value
				} else if (value) {
					mc = new GregorianCalendar()
					mc.setTime(value)
				}
				def mday
				def mmonth
				def myear
				
				if (mc != null) {
					mday = c.get(GregorianCalendar.DAY_OF_MONTH)
					mmonth = c.get(GregorianCalendar.MONTH) + 1
					myear = c.get(GregorianCalendar.YEAR)
				}
				
				sb << ","
				sb << "minDate: new Date(${myear}, ${mmonth}, ${mday})"
			}

			sb << "});"

			// inposta la data corrente
			if (value)
				sb << "\$(\"#${jquerySelector}_vis\").datepicker(\"setDate\", new Date(${year},${month-1},${day}));"


			out << r.script() { sb.toString() }
		}

	}

}
