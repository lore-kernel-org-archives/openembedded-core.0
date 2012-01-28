Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrCu1-0007yc-72
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 19:21:29 +0100
Received: by lahc1 with SMTP id c1so1475127lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1P7YfESiIWwPSC2R4r2eJl6VDcug8Jar5yHIiyKE7ok=;
	b=MfLVR8LYz/1pSEVX2VAagR0NJfVA1zgjxgB2ywpg+WviREBERaHwgjlxMkbUWO+KkV
	KKH1DAFZUHdoAidnBDYiDhP5xanbstd1AVp8ywq0UsmdSLDXxpgL+kOjBbhYgvERzqFS
	oMVf31Nj2R4YSa1SDkCmjjt4ay1cMWpi8RJA4=
Received: by 10.112.101.34 with SMTP id fd2mr2963809lbb.16.1327774417252; Sat,
	28 Jan 2012 10:13:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sat, 28 Jan 2012 10:13:07 -0800 (PST)
In-Reply-To: <4F21DABC.3000007@linux.intel.com>
References: <4F21DABC.3000007@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jan 2012 10:13:07 -0800
Message-ID: <CAMKF1soeiB-6BKY8radeAh4GMAq2-r90uPGAR_k_jyThFWNzcA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>
Subject: Re: opkg-utils to move to git.yoctoproject.org
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
X-List-Received-Date: Sat, 28 Jan 2012 18:21:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2012 at 2:59 PM, Saul Wold <sgw@linux.intel.com> wrote:
> We will make this change next week barring any major objections.

its a good idea infact. will you do svn2git conversion as well. ?


