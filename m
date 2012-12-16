Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wmat@alphatroop.com>) id 1TkLie-0003Kt-4I
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Dec 2012 22:25:56 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so4635302iad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2012 13:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=u2VzoZyL6Xzqn2wsiEM5qqbHtfRFBoPm+9vbWwai7Oc=;
	b=Kv0+5G2s1fr9XuQakFQ1S1W9Du5+c9Xwb7u3W7cVA0f6hodqQQ89ZQ5R6yp/CoY+6e
	QsYK5THKP15xQ6/WIXz9ecSHOZANycrBwuAwvY1cgcBV2GfE4s2RdPlhNvpOuBRRXnPi
	j5etZifvHMSHMnfEO6n6LiWBdQoe0WCBvYsdwuZrT58wbo8RviwUqkmTbwrOgAIEWpJ5
	I4ZFAElKyngsrOagI7eBVEIEvPeCKhbbvDiJXmOEkadwy5bCtntJTRa+1BNjpMixoNyF
	ybHhmFxO2k8QQ3eT7+g9Z4IN5E1/6zj1p9VUKMG4NCZ26kQscT5WRy+w9rMG1fiXE2fd
	KkVw==
MIME-Version: 1.0
Received: by 10.50.219.233 with SMTP id pr9mr7468266igc.19.1355692276052; Sun,
	16 Dec 2012 13:11:16 -0800 (PST)
Received: by 10.50.74.169 with HTTP; Sun, 16 Dec 2012 13:11:15 -0800 (PST)
X-Originating-IP: [24.246.30.132]
Received: by 10.50.74.169 with HTTP; Sun, 16 Dec 2012 13:11:15 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1212160555200.745@oneiric>
References: <alpine.DEB.2.02.1212160555200.745@oneiric>
Date: Sun, 16 Dec 2012 16:11:15 -0500
Message-ID: <CAGfZjq49PpLifX4aRAJ1gq7L8mm45Wqm3w+3wRYRS6_QqMsfcA@mail.gmail.com>
From: Bill Traynor <wmat@alphatroop.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Gm-Message-State: ALoCoQlkmAEKF8pWQ8EQjI6LSpExEtmjd3E+SyGOzgyJUcawN9lwdNtzAn5NwS0Jrem1VfDrpHTO
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: sprinkled references to "powerpc" vs "ppc" in adt-installer
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
X-List-Received-Date: Sun, 16 Dec 2012 21:25:56 -0000
Content-Type: multipart/alternative; boundary=14dae934120f89f12e04d0feb44d

--14dae934120f89f12e04d0feb44d
Content-Type: text/plain; charset=ISO-8859-1

On Dec 16, 2012 5:57 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
>
>   perusing adt-installer recipe and files and i notice there are a few
> mentions of "powerpc" whereas it seems that "ppc" is the correct
> architecture abbreviation.  obviously doesn't hurt anything but it
> might be confusing for people reading the source.

Isn't the architecture just called Power now?

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--14dae934120f89f12e04d0feb44d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Dec 16, 2012 5:57 AM, &quot;Robert P. J. Day&quot; &lt;<a href=3D"mailto=
:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; =A0 perusing adt-installer recipe and files and i notice there are a f=
ew<br>
&gt; mentions of &quot;powerpc&quot; whereas it seems that &quot;ppc&quot; =
is the correct<br>
&gt; architecture abbreviation. =A0obviously doesn&#39;t hurt anything but =
it<br>
&gt; might be confusing for people reading the source.</p>
<p dir=3D"ltr">Isn&#39;t the architecture just called Power now?</p>
<p dir=3D"ltr">&gt;<br>
&gt; rday<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 Ottawa, Ontario, CANADA<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <a href=3D"http://cras=
hcourse.ca">http://crashcourse.ca</a><br>
&gt;<br>
&gt; Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 <a href=3D"http://twitter.com/rpjday">http://twitter.com/rp=
jday</a><br>
&gt; LinkedIn: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
<a href=3D"http://ca.linkedin.com/in/rpjday">http://ca.linkedin.com/in/rpjd=
ay</a><br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>
</p>

--14dae934120f89f12e04d0feb44d--
