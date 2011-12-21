Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdCy8-0002sI-2S
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 04:35:52 +0100
Received: by eaal1 with SMTP id l1so6370138eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 19:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ctgTQWwMc6hJROGb2aAwSc5UIil8+ztNmS5tJDnHwDs=;
	b=PS+3y3Key6znASV0BB3hS0lpburK16cQ/uTIFO7Jt0wbfYs4UIh7gGC+apEPjNswXh
	Dfd7ETAP5V6hSkiz4TEUTK7jRWEdkNz7hv68nzFSSsR9XoJOzJm5y4mz3S8ZCSNUJsay
	WmRhhbX6wsTlDjF6hgAT/7QyfAcbh+eaqnHJw=
MIME-Version: 1.0
Received: by 10.205.120.148 with SMTP id fy20mr1303644bkc.125.1324438127080;
	Tue, 20 Dec 2011 19:28:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Tue, 20 Dec 2011 19:28:46 -0800 (PST)
In-Reply-To: <4EF150A1.60404@linux.intel.com>
References: <cover.1324121806.git.otavio@ossystems.com.br>
	<20d7007632dde53f3a868e8374a45619319213c2.1324121807.git.otavio@ossystems.com.br>
	<4EF150A1.60404@linux.intel.com>
Date: Wed, 21 Dec 2011 01:28:46 -0200
X-Google-Sender-Auth: qWNVVcgayQIhKib5gyFpKsktPjo
Message-ID: <CAP9ODKrTMaJugUXTTQYWS0N_S-13jDXCvJ9aP4HL0hjhZYdZgg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] connman: disable 'alg-test' building
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
X-List-Received-Date: Wed, 21 Dec 2011 03:35:52 -0000
Content-Type: multipart/alternative; boundary=000e0ce040521776e004b491c8d0

--000e0ce040521776e004b491c8d0
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 21, 2011 at 01:21, Darren Hart <dvhart@linux.intel.com> wrote:

> (I understand this is poky related and not oe-core, but as the context
> for this patch is here, I opted to continue the discussion here.)
>

It seems you haven't applied the patch as it shows the message that the
patch clearly remove.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0ce040521776e004b491c8d0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Dec 21, 2011 at 01:21, Darren Hart <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
(I understand this is poky related and not oe-core, but as the context<br>
for this patch is here, I opted to continue the discussion here.)<br></bloc=
kquote><div><br></div><div>It seems you haven&#39;t applied the patch as it=
 shows the message that the patch clearly remove.</div><div>=A0</div></div>
-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" t=
arget=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossys=
tems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0ce040521776e004b491c8d0--
