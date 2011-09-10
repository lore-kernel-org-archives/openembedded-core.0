Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1R2R5K-0003Ul-LS
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 19:11:18 +0200
Received: by yia28 with SMTP id 28so1587943yia.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=pq7Bhllcl5zVU7qG+cjMUUvuV2OazOCxTY+vDMVbr+Y=;
	b=GUeKoj9rjnurUNtWDLqHL8M0NF/FH8V7lYtO2/unCJcdmD3gZXs23di2xr0sR4g7uk
	X4P86KdbymCrW9r+qpeqLkAUtcRSHr9RH1G1rPxMwfBTzOC/cD8GkIvpE9cHsKrTlHPD
	svgS/2iEDXffh9BPbwAmxbWRzTSiD0YIWdeWw=
MIME-Version: 1.0
Received: by 10.236.37.202 with SMTP id y50mr18768158yha.101.1315674372147;
	Sat, 10 Sep 2011 10:06:12 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.236.111.35 with HTTP; Sat, 10 Sep 2011 10:06:12 -0700 (PDT)
Date: Sat, 10 Sep 2011 19:06:12 +0200
X-Google-Sender-Auth: OKhXLGgCsDc7AXY6HB96RoQ3wNI
Message-ID: <CA+2YH7vrG5b5ZH+_YSG6-F_fJT54rL_0B7JCjr9UiHRSiXdmJQ@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: openembedded-core@lists.openembedded.org
Subject: udev mirror
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Sep 2011 17:11:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

since kernel.org is down udev (173) can't be fetched, do you know a
mirror that can be used?

I've tried one that i found googling around but i think it's not
updated and i get build errors.

Thanks,

Enrico


