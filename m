Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daiane.list@gmail.com>) id 1SV0Gl-0000yj-1v
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 14:57:27 +0200
Received: by vbbfr13 with SMTP id fr13so1719714vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 05:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ibmd8H65wpZKjVjlXK5u4CJ9yDwxdZqIccVPUlyUdzM=;
	b=Rc8na5EqGPJ6o+CFHyuvaMD/7xpbzkKT6S3EDNulk/S42GCjRN31kR6nHhDd0xx0tK
	bpG9ZurcktmyVBzGd3kNJ6q9WyG5yqXh07xsJEkVhI6A7hUdznYJeMxWmupSz3HFcbln
	Xjvi6e3TO3FcUQg4X2BpQxvbc8Bxww2LaKxvhh7ZUe+5wu4yrtVQjmoL0DpoEwbtRoUH
	B/IO4I4f1rRL1FXXCkm7mdA+6HPXBSlrraJ9leWnrp7jhTe8ZlYz8z7M2p8QKw6VPvHy
	tzm5uOjoL0jxL7kXP79CKrY5pr+DcGAfdxt/E3k8Jg/aN+6pQ7b1Aiye5GvKdWlZjA6f
	JaCw==
MIME-Version: 1.0
Received: by 10.220.107.208 with SMTP id c16mr4854018vcp.65.1337258843698;
	Thu, 17 May 2012 05:47:23 -0700 (PDT)
Received: by 10.52.38.65 with HTTP; Thu, 17 May 2012 05:47:23 -0700 (PDT)
In-Reply-To: <CC134498-24AC-40B5-BDF8-1097E74A7FE9@dominion.thruhere.net>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
	<CAMKF1so4jRESbLbG867ehEBRgJjh=nJcoLPsFjNtvC+tnCg=Og@mail.gmail.com>
	<CAP9ODKq51+a9UbXP9wdgRnP4_LtX+wPt=ujCL7iZptBQNhq92A@mail.gmail.com>
	<CAMKF1sq+aa+kEJ62g2CE_FQKLd-8_wVTks4CB5tQn43-4y8ZZw@mail.gmail.com>
	<CC134498-24AC-40B5-BDF8-1097E74A7FE9@dominion.thruhere.net>
Date: Thu, 17 May 2012 09:47:23 -0300
Message-ID: <CA+jg_OWX_ZF5UzzoWDauZquixUFL41KJP9umZMuoA-4C5T3mWg@mail.gmail.com>
From: Daiane Angolini <daiane.list@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Thu, 17 May 2012 12:57:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 17, 2012 at 4:44 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Let's make a deal: new recipes will only be accepted into oe-core after sato has been removed from the oe-core layer.

Ok, I understand.

Could you, please, point me the right place/layer it should be included?



Daiane Angolini


