Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TrNr1-0005cs-U9
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 08:07:40 +0100
Received: by mail-vc0-f175.google.com with SMTP id fy7so17110061vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 22:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7WzP9PoD2I/Qs6HPGNrhnhtemGHqe9gO9wAezKoKEuU=;
	b=Qfw5Ch6SolQiEXuQO8S7825yzPur1ctx7vG4a8BlDgzmgPJPy6zqtosp6BkVxznK5F
	gZU+yD5xr1jKg1KoRmjrMXlFnpuS7bAKudVcCz8DSBL8vpmRq9BFITooIn+J1RMnuPVl
	Od5l4SzcnnttgJ1znSMshiCY6BAuEJtAjBrWQ1VQi+Rz5mZGxmjDiIxhmx7AAbVuzbJA
	oGOLNP/JWU81e2D/hv6pHzUa+j7RqTezWN8alK4b8Wq5Xa+mKkQaRRFI6ou+wSJVuEmv
	flsKWQmQWaqTY0lgPf1a+IzwW9Az9BskAKijTGxL6ptWyWstJ7OhsWo1P/u/MleS5/rC
	TwJQ==
MIME-Version: 1.0
Received: by 10.52.33.228 with SMTP id u4mr68640000vdi.4.1357368753397; Fri,
	04 Jan 2013 22:52:33 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Fri, 4 Jan 2013 22:52:33 -0800 (PST)
In-Reply-To: <cover.1357366840.git.sgw@linux.intel.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
Date: Sat, 5 Jan 2013 08:52:33 +0200
Message-ID: <CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Sat, 05 Jan 2013 07:07:41 -0000
Content-Type: text/plain; charset=UTF-8

On 5 January 2013 08:22, Saul Wold <sgw@linux.intel.com> wrote:
>
> Saul Wold (3):
>   glib-2.0: Update to 2.35.3

 Is there some specific need for bleeding edge (unstable development snapshot)?



 - ML


