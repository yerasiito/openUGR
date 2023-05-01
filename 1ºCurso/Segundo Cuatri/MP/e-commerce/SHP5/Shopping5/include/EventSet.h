/**
 * @file EventSet.h
 * @author estudiante1: López Ramírez, Yeray
 * @author estudiante2: Velázquez Ortuño, Diego
 * @note To be implemented by students 
 * 
 */

#ifndef EVENTSET_H
#define EVENTSET_H

#include <string>
#include <cassert>

#include "DateTime.h"
#include "Event.h"

#define MAXEVENT  500

class EventSet {
private:
    Event * _events; // Set of events load correcty
    unsigned _nEvents; // Number of available event
    unsigned _capacity; // size of the allocated block of memory
    
    /**
     * @brief reserve memory for 2*n+1 events
     * @return one The object with the ampliated memory
     */
    Event * allocate(int capacidad);
    
    /**
     * @brief Add memory for the array of events
     */
    void reallocate(int new_cap);
    
    /**
     * @brief Free memory
     */
    void deallocate();
   
    /**
     * @brief Copies in a low level the complete array  of *this to an dynamic array 
     * pointed by dest. In order to do the copy more efficient.
     * @pre assumes that dest has memory space allocated to host the elements   
     * @param dest starting address for the destination block
     */
    void  copy(Event *dest) const;
    
    /**
     * @brief copy the EvSet object to the current one
     * @param one EvSet object from which _events is copied
     */
    void copy(const EventSet &orig);
    
public:
    //Constructor
    /**
     * @brief Basic constructor and initializer. 
     */
    EventSet();
    
    //Consult metods
    /**
     * @brief Returns the number of events stored.
     * @return The number of events
     */
    int size() const;
    /**
     * @brief transform an eventSet to a string, 
     * @return string that contains the number of components and en eventSEt serialized
     * 
     * @todo in order to define this function we suggest the use of (+) for string and the function to_string(int d) 
     */
    std::string to_string() const;

    /**
     * @brief get the event in a position selected, for consulting
     * @param pos, position in the EventSet
     * @return the selected event in the EventSet
     * @warning If pos is not a valid value, it returns NULL_EVENT, that is
     * one event whose isEmpty() method returns true.
     */
    const Event & at(int pos) const;
    
    /**
     * @brief Writes the EventSet in an output stream in CSV format.
     * @param os output file stream
     */
    void write(std::ofstream & os) const;

    int getCapacity() const;

    //Modifier methods

    /**
     * @brief Resets the set of events to 0 components 
     */
    void initDefault();
    
    /**
     * @brief add a new event at the end of the eventSet whenever there is room.
     * @param e an Event
     * @return 1 when the operation has been successful, 0 when it fails
     * 
     */
    int add(const Event & e);
    
    /**
     * @brief add a new event at the end of the eventSet whenever there is room.
     * @param line the input string from which to form the Event
     * @return 1 when the operation has been successful, 0 when it fails
     */
    int add(const std::string & line);

    /**
     * @brief get the event in a position selected, for modification
     * @param pos, position in the EventSet
     * @return the selected event in the EventSet
     * @warning If pos is not a valid value, it returns NULL_EVENT, that is
     * one event whose isEmpty() method returns true.
     */
    Event & at(int pos);
    
    /**
     * @brief Reads the EventSet from an input stream
     * @param is input file stream
     * @param nelements number of elements to be read
     * @return bool True if the reading operation has been successful, false 
     * otherwise
     */
    bool read(std::ifstream & is, int nelements);
    
    /**
     * @brief Shows the number of events in the EventSet and a numeric 
     * value that encodes the whole set of events
     * @return A string made up of the size of the EventSet and the
     * numeric code of its content
     * @warning please do not modify its implementation
     */
    std::string reportData() const {
        std::string result = "";
        for (int i = 0; i < _nEvents; i++) {
            result += std::to_string(std::hash<std::string>{}(_events[i].to_string()));
        }
        result = std::to_string(std::hash<std::string>{}(result));
        result = std::to_string(_nEvents) + " " + result;
        return result;
    }
    
    //New Methods
    /**
     ∗ @brief Copy constructor, a new object is created from the parameter object
     * @param orig the EventSet we want a copy from
     */
    EventSet (const EventSet & orig);
    
    /**
     * @brief Destructor, deallocate the allocated memory of the object
     */
    ~EventSet();
    
    /**
     * Assigment operator overload. This operatos copies the content of other
     * EventSet into this.
     * @param one EventSet to be copied
     * @return Reference to this, in order to chain the operator
     */
    EventSet & operator=(const EventSet & one);

};

/**
 * @brief compute the total sum for price, on the complete EventSet
 * @return the total computed
 */
float sumPrice(const EventSet & evSet);
/**
 * @brief It explores all the EventSet and builds a string[] composed of all different
 * values taken by the field @a field
 * @param field The field of the event
 * @param values Array of values (as string) which is made up of all different values of the
 * field @a field
 * @param n_values Number of different values found
 */
void findUnique(const EventSet & es, const std::string & field, std::string values[], int & n_values);
/**
 * @brief Extract a subset of the EventSet composed only of those events in which
 * the given @a field matches the given @a value
 * @param field     The name of the field of the event. According to @see Event.h
 * @param value     The value of the field that will be used to partition the EventSet
 * @return An EventSet which is a subset of the current one in which all events
 * have @a field == @a value
 * @deprecated
 */
EventSet rawFilterEvents(const EventSet & es, const std::string & field, const std::string & value);

/**
 * @brief Give string[] and a string, it searches for string within string[]
 * @param array     The set of strings to llok for
 * @param n_array   The size of string[]
 * @param name      The string that is being seeked
 * @return          The position of the first occurrence of string within string[]
 *  -1 if the string does not belong to string[]
 */
int findString(const std::string array[], int n_array, const std::string & name);

extern Event NULL_EVENT; /// It defines an EMPTY Event which can be used to identify error cases


#endif /* EVENTSET_H */

