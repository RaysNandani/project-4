package in.co.rays.proj4.exception;
/**
 * DuplicateRecordException thrown when a duplicate record occurred
 *
 * @author Nandani kumbhkar
 *
 */
public class DuplicateRecordException extends Exception {
	/**
     *            : Error message
     */
	public DuplicateRecordException(String msg) {
        super(msg);
    }
}
