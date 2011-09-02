Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1QzTmu-0003Rj-Fs; Fri, 02 Sep 2011 15:28:05 +0200
Received: by bkbzu17 with SMTP id zu17so2587811bkb.6
	for <multiple recipients>; Fri, 02 Sep 2011 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=oMFSe2QWgpTHTt113Cdnl0ciX4C2382Mz6YrubEA72Q=;
	b=X4un0MTFb/VZz+IQGapy/UNXAL6uFOoMWu1F1G+VKa+h+P49pQbBavAOgMvqiLoaY8
	YbldYHjRB+xb0CWrYxdPlHW7HICPhilDTOlOtlrZ8+x3jpH3F7ODbs/4KFJk0nFOr7C1
	6gifkijcRvu1+zWQZ/y40C6flt9xpBdX1NlYQ=
MIME-Version: 1.0
Received: by 10.204.132.7 with SMTP id z7mr575680bks.301.1314969787302; Fri,
	02 Sep 2011 06:23:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.131.201 with HTTP; Fri, 2 Sep 2011 06:23:07 -0700 (PDT)
In-Reply-To: <1314969543.5939.586.camel@rex>
References: <1314962732.3526.32.camel@mattotaupa>
	<CAP9ODKpMU3yr==7+qyBvTyW3ikoSXtZqurKwsCn3Nn_54E0k7Q@mail.gmail.com>
	<1314969543.5939.586.camel@rex>
Date: Fri, 2 Sep 2011 10:23:07 -0300
X-Google-Sender-Auth: J1_DOajKaD9C4l_e5DPPjmT74-Y
Message-ID: <CAP9ODKoDFrgfTXeCw-dtGn4s_V+Uxh4U4HfbWe-0OOBAC385=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Please merge lists openembedded-devel and openembedded-core again.
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
X-List-Received-Date: Fri, 02 Sep 2011 13:28:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 2, 2011 at 10:19, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> I fully support this merge.
>
> I'm not so sure rushing into this is a great idea. Speaking as someone
> who has problems trying to figure out where patches are intended for and
> who tracks whether they've been applied, I do find the split useful...

This is a matter of improving the pull request script; avoiding
duplicated places allow for easy sharing of information besides many
OE devels and users are not in oe-core list making duplicated work and
not being aware of changes.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


