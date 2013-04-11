Received: from mail-bk0-f45.google.com ([209.85.214.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UQDfn-0005rH-2F
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 11:20:04 +0200
Received: by mail-bk0-f45.google.com with SMTP id j10so684950bkw.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VS64sGUnEf9eJqSISDEnwBq39XIzz68sDwza1nye4q0=;
	b=Q3xe6zWLrrG2fTaws0/W7P6azlxLO1AB+e+82ZBLO7SjveP2a6pah2zybC1jk/MFJa
	ZS6XI3DJfxCMY7mGPZL6NR+XekobjXJlGfkymA0rwvt3hZzWVRDddS9FQ1sIvogSg4b8
	G9rqJ1uRLmGljgtBzkfFa9tjdeDn71yCjIa7Wfdw0VPbyhSo0ZvoFej+C7Gu89zhCmUb
	rK7OotSmtVdVuUwKPcLlbgnE2wnoGQcqSBd6hgGR8VZG/VmHk7lyxtAhBqx+LrHIKURo
	dgywxTJVQo0xmpAnVrwUlLNkpJ3Z3GOVMCI7WIB1EUAyVxNxKLYNjPWvtRWcSrZCCFAH
	4YiQ==
X-Received: by 10.204.80.140 with SMTP id t12mr2088312bkk.85.1365670960418;
	Thu, 11 Apr 2013 02:02:40 -0700 (PDT)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id b21sm1375961bkw.12.2013.04.11.02.02.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 02:02:39 -0700 (PDT)
Message-ID: <51667C2D.1040007@gmail.com>
Date: Thu, 11 Apr 2013 11:02:37 +0200
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
	<929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
	<CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
	<5165AB03.8020404@gmail.com> <20130410193611.GF2471@jama>
	<5165C0E7.8030203@windriver.com>
In-Reply-To: <5165C0E7.8030203@windriver.com>
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 09:20:05 -0000
X-List-Received-Date: Thu, 11 Apr 2013 09:20:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/04/2013 21:43, Mark Hatle ha scritto:

>>> Yes, it is copied from meta-openembedded into oe-core
>>
>> Then you should fix commit message too
>>
>>   * Recipe taken from oe-classic
>>
>> In all recipes you sent to oe-core.
>
> See: http://openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Specifically the Example: Importing fro Elsewhere Unmodified (and modified)
>
> It's a good idea to list where it came from the commit.. that way if the
> original location is ever changed, people can track what changes may
> need to be merged in.
>

OK
thank you Mark


-- 
Marco


