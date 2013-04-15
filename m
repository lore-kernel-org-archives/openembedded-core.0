Received: from mail-qe0-f44.google.com ([209.85.128.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1URmMJ-0006df-4J
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:34:25 +0200
Received: by mail-qe0-f44.google.com with SMTP id i11so2776084qej.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=RAuPxd4ZKp3ET6/jhUt7kVEgFWQT9Qsq7ZfLVElqZDk=;
	b=L1uVOndjB3kG/h7d6AVgfx8/GcM/4i6wivUAQM79iyQBbVECf6rxsZo3WLjsOV7u73
	Jpq9GmQxl/z5r1TDj86IJ3b36RsO0Xdukr0gvR4W4rjdUc7rBytog67zLuYOaOxdt1WH
	CEu/6psuRVU41N5XooaKvaDZSuZk0mfDGWc2wYXr0ix0edSSuzEGhCFRLkBrYeiVYE58
	vYxsChJTdtOMoVtBcFSjcI9uKipCkG3Ny6lCGzgOvE/PJTBy8iiZEJA7XijWxNsnr9Nm
	/NLw72ltgDLt1ATWEKc0tjj7/h6TGEJdu13jJ3i0L8QfO68l8Bhdy9QcByj+euCyswRV
	7Uiw==
MIME-Version: 1.0
X-Received: by 10.224.44.2 with SMTP id y2mr22583854qae.7.1366042604427; Mon,
	15 Apr 2013 09:16:44 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Mon, 15 Apr 2013 09:16:44 -0700 (PDT)
Date: Mon, 15 Apr 2013 19:16:44 +0300
Message-ID: <CADV-EXHFSOppcEJezD_OEUFF_Xo=c9J=560ssn5J=WKAj2x_+w@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: psplash and systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 16:34:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is there a way to display image with progress bar during boot (using
psplash) with systemd?

Best regards,
Yevhen


