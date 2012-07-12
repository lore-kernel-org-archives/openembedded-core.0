Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SpPdG-000633-PJ
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 22:05:02 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 12 Jul 2012 12:53:48 -0700
Received: by qcmv28 with SMTP id v28so1598590qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 12:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=5OaItxPQ3iMNgAKBBUTjNJiFAuyxPrcJrGbO3WULE54=;
	b=oNuXvXHF/6ITQ9ru7kLOSivRSqvpKVZq+aLW4dCrIN3uL12DJqfgdI17pss19FIqrP
	ooo5tKOCXdPFgK/xsbH7JaZhOv9wAAnSe70N8PndTqaKmYCo730uY80UKP5F2PMRhPFU
	Dny0m5btfgCE2QlO1Yjh628oJRrc2P4tN1zLi8oihn+PgrcIjeTW1HwZg0hpzaCgWSh5
	XMX0UcEvThTEJX+T/8PjuyEmNYqw7ANZPVKUo7GY9Z/XDlIpVmfprjH0Ia1Mq/71Nxtc
	3vsHLITNuYQA0cOzSCqc0xMmQhGH0b8zojJp0vGWUJ5Z4IH1JJPyE2U00Bl4lDsVa7EL
	Vqew==
Received: by 10.224.176.204 with SMTP id bf12mr6675588qab.92.1342122827242;
	Thu, 12 Jul 2012 12:53:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Thu, 12 Jul 2012 12:53:26 -0700 (PDT)
In-Reply-To: <cover.1342115559.git.andrei@gherzan.ro>
References: <cover.1342115559.git.andrei@gherzan.ro>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jul 2012 20:53:26 +0100
Message-ID: <CAJTo0LbsUOexzdQi1hbVAHX9zX5q6RA-Y+f4ZiBVMM=Gjjykew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmrjHAHTdKWpd5gBa5fh9T1XrERiBqfijPE3iEUyiEJk2TXvwgnznZFEedFJZ4K1D1HZfnh
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH 0/2] Update connman to v1.3 and fix dependencies for some tests
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
X-List-Received-Date: Thu, 12 Jul 2012 20:05:03 -0000
Content-Type: text/plain; charset=UTF-8

Looks good!

Acked-By: Ross Burton <ross.burton@intel.com>


