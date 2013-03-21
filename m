Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UIkWq-00031t-Cr
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 19:48:00 +0100
Received: by mail-la0-f53.google.com with SMTP id fr10so5673955lab.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=xkWDgG+JWeW/Az5in5WThzVnPGmK46eZqB2o2/I2eos=;
	b=plVJrYBxglhpwTHemfQAIVsKjp30EDOghLHD+ffi+0zojov9PfbKwa6Y2ipys4LFPP
	+gZOCCoia7MUUDHdpEeWpA784nkk+8ame53Zur/P64QYOhcR8pLwdRpI5m3a9K933D4/
	U+2UuAzJOuFOKHz+W4zUVeKnkhAhobk8B9RokvVAnykbeth7ETVCY+ctSLauHyPUuMFK
	zozQNO9yylu7ctUqCxCer1SVFOl68Si+6woewgWwf2ml9z6/yiZA4PkD2C9CgFI+snH2
	MqPhO6Iql6cDhcFTtLRW4mE3GQIiCTz+aBDWugQ//LlaAZf7kKIXzTtyOSuB8oVykgR7
	+MhQ==
X-Received: by 10.112.30.104 with SMTP id r8mr12296260lbh.82.1363890663582;
	Thu, 21 Mar 2013 11:31:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.25.195 with HTTP; Thu, 21 Mar 2013 11:30:43 -0700 (PDT)
In-Reply-To: <1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1363881315-24352-15-git-send-email-richard.purdie@linuxfoundation.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 21 Mar 2013 11:30:43 -0700
X-Google-Sender-Auth: t3v-jMuAA4yeWfqYfx2bpDvHYq8
Message-ID: <CABcZANmPy+-XyBcsFEPYaAEZm0rJZnrrippKjJeXJjXmuff0XQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/16] distro: Add separatebuilddir.inc
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
X-List-Received-Date: Thu, 21 Mar 2013 18:48:05 -0000
Content-Type: multipart/alternative; boundary=f46d04016b3983faa304d8738aee

--f46d04016b3983faa304d8738aee
Content-Type: text/plain; charset=UTF-8

Out of curiosity, what's with the pn-pn- overrides?
-- 
Christopher Larson

--f46d04016b3983faa304d8738aee
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Out of curiosity, what&#39;s with the pn-pn- overrides?<div class="gmail_extra">-- <br>Christopher Larson</div></div>

--f46d04016b3983faa304d8738aee--
