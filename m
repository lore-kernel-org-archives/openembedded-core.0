Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UBSk2-0001I6-Gy
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 17:23:27 +0100
Received: by mail-wi0-f172.google.com with SMTP id ez12so9266825wid.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=EENfXZknJVVqmCZa2lEGzibVSHo1CZqeMwMFgMnLyEc=;
	b=jaebL0dXWB4q9J7SfpOAmfctO+EHhT+7IzEQCn+YS29xSAEtdRTo4ED0hqhA35Zm+f
	1Kjp41v5CdTbKOCh4wfSf109I0xmTwAolEAb+lFgArdP7aG9+TzvFuKCI+HTk9qY5iMf
	YeATHXUku7BSs+gKwfxN07rgqPh8mzzxcavO25Qmj/yfJcVsOZmta+hsbEWZlbKFAyl9
	KDJUsEPp6YcX73rmQB24rVvV/p1hNsBEuMRELynx72jSebA5vmbUWAxEmEOw5eJnYm2Y
	/hhzy0dhOiuKA3H4hD0rd5d76KdtZHS4wxO4mOp3/TCdVQIQQ7nGuUQMnrZV7i0Qc9FK
	D1mg==
MIME-Version: 1.0
X-Received: by 10.180.104.10 with SMTP id ga10mr4863982wib.23.1362154023133;
	Fri, 01 Mar 2013 08:07:03 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Fri, 1 Mar 2013 08:07:03 -0800 (PST)
In-Reply-To: <20130301160149.GN3279@jama>
References: <cover.1362003285.git.sgw@linux.intel.com>
	<1362093308.1055.4.camel@ted> <20130228234226.GC3279@jama>
	<1362097609.1055.35.camel@ted> <20130301091804.GF3279@jama>
	<CAHUNapT1kVsUjTSMkbcVXLjBK7kGMu3dQKNuSTk4t51wEnYgZw@mail.gmail.com>
	<20130301160149.GN3279@jama>
Date: Fri, 1 Mar 2013 11:07:03 -0500
Message-ID: <CAHUNapTG128A7-tt8REsgJo0iATR2aAnQJCgzoxRUN1Ok+4Mew@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/40] Post-ELC Patches and Updates
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
X-List-Received-Date: Fri, 01 Mar 2013 16:23:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 1, 2013 at 11:01 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> send lsb_release -a output

openSUSE 12.2:

$ lsb_release -a
LSB Version:
core-2.0-noarch:core-3.2-noarch:core-4.0-noarch:core-2.0-x86_64:core-3.2-x86_64:core-4.0-x86_64:desktop-4.0-amd64:desktop-4.0-noarch:graphics-2.0-amd64:graphics-2.0-noarch:graphics-3.2-amd64:graphics-3.2-noarch:graphics-4.0-amd64:graphics-4.0-noarch
Distributor ID: SUSE LINUX
Description:    openSUSE 12.2 (x86_64)
Release:        12.2
Codename:       Mantis


