package com.slalom.api;


public class Calculation {

        private final long id;          //unique id for each calculation
        private final int result;    //resulting sum for this calculation

        public Calculation(long id, int result) {
            this.id = id;
            this.result = result;
        }

    /**
     * @return the id of this calculation
     */
    public long getId() {
            return id;
        }

    /**
     * @return the sum of the arguments
     */
    public int getResult() {
        return result;
    }

    /**
     * @return the resulting greeting message as a String
     */
        @Override
        public String toString() {
            return String.valueOf(result);
        }


}
