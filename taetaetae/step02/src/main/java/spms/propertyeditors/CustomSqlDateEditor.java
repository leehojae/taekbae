package spms.propertyeditors;

import java.beans.PropertyEditorSupport;

public class CustomSqlDateEditor extends PropertyEditorSupport {
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		this.setValue(java.sql.Date.valueOf(text));
	}

}
