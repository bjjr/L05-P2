/* EventController.java
 *
 * Copyright (C) 2016 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 * 
 */

package controllers.organiser;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.EventService;
import controllers.AbstractController;
import domain.Event;

@Controller
@RequestMapping("/event/organiser")
public class EventOrganiserController extends AbstractController {
	
	// Services ---------------------------------------------------------------
	
	@Autowired
	private EventService eventService;
		
	// Constructors -----------------------------------------------------------
	
	public EventOrganiserController() {
		super();
	}
	
	// Listing ----------------------------------------------------------------
	
	@RequestMapping("/list-organised")
	public ModelAndView listOrganised() {
		ModelAndView result;
		Collection<Event> events;
		
		events = eventService.findOrganised();		
		result = new ModelAndView("event/list");
		result.addObject("events", events);
		result.addObject("requestURI", "event/organiser/list-organised.do");
		
		return result;
	}	
	
	// Creation ---------------------------------------------------------------
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Event event;
		
		event = eventService.create();		
		result = createEditModelAndView(event);
		
		return result;
	}
	
	// Edition ----------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int eventId) {		
		ModelAndView result;
		Event event;
		
		event = eventService.findOneToEdit(eventId);		
		result = createEditModelAndView(event);
		
		return result;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid @ModelAttribute Event event, BindingResult bindingResult) {
		ModelAndView result;		
				
		if (bindingResult.hasErrors()) {
			result = createEditModelAndView(event);
		} else {
			try {			
				eventService.save(event);
				result = new ModelAndView("redirect:list-organised.do");
			} catch (Throwable oops) {
				result = createEditModelAndView(event, "event.commit.error");				
			}
		}
		
		return result;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@ModelAttribute Event event, BindingResult bindingResult) {
		ModelAndView result;		
		
		try {			
			eventService.delete(event);
			result = new ModelAndView("redirect:list-organised.do");
		} catch (Throwable oops) {
			result = createEditModelAndView(event, "event.commit.error");			
		}
		
		return result;
	}
	
	protected ModelAndView createEditModelAndView(Event event) {
		assert event != null;
		
		ModelAndView result;

		result = createEditModelAndView(event, null);
		
		return result;
	}
	
	protected ModelAndView createEditModelAndView(Event event, String message) {
		assert event != null;
		
		ModelAndView result;				

		result = new ModelAndView("event/edit");
		result.addObject("event", event);
		result.addObject("message", message);
		
		return result;
	}	
		
}