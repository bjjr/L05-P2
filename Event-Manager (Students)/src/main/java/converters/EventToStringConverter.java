/* EventToStringConverter.java
 *
 * Copyright (C) 2016 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 * 
 */

package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Event;

@Component
@Transactional
public class EventToStringConverter implements Converter<Event, String> {
	
	@Override
	public String convert(Event event) {
		String result;

		if (event == null)
			result = null;
		else
			result = String.valueOf(event.getId());

		return result;
	}

}
