Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.5629.1587871199482216547
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 20:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JQ3+6OaF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.210.52, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-ot1-f52.google.com with SMTP id b13so20113634oti.3
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 20:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=jlG8XyNBoZlC2Z4iZ20ASq+a0pTf8BuaTqQoFmxLaKc=;
        b=JQ3+6OaFYSZzkEYyIGKD+yb97amE2i+a9sMXMhjzUwBATVTiRaAkoyB40E1uf+HaHa
         u3g/2S1OdU3TjZ2br4i5HxaC7JQXUC+PMxsYBeARGuSnR8CvvhnnmsXIBlggiEp69zL3
         DDfYbzMi2et+pDTVlMRfHX6JKFqrwKPi9Ily0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=jlG8XyNBoZlC2Z4iZ20ASq+a0pTf8BuaTqQoFmxLaKc=;
        b=F7u58Lp4FYBeKKQI9HTxA5lx8urk2OL/Zj/XxJWWyLufjNPNGqyWx4CMNTq6mpf1px
         f1mWl4oqeZQL52WH4l3vZx8LqAaHftBnlZuVaSqfEM4wCZ0pWMSn8kaGaRE75eoM7wlT
         HXZtwt2ZOjFPwMhO8gQnxQpaPfWM1/jAsbFgkLXo8es6ZTrkJSDUotv4Yqz0+JPrG+Sa
         Nx9UaAcswWyCYqJOlRuJKEO1ePuleWXJL9qls5iLb59HznyP4gvXsNNIoHRcsAUhJ1gl
         nGSz0ikcp9nEWaGGFrQRmhJh2X0J/7emKlu7EJp0bm+QByNSc7MxCaPmh/qdGydhE9e8
         pK+Q==
X-Gm-Message-State: AGi0PubSUiMJi1Cx4+9yIDJETLSeKyQk+G9k5awNAD6V2xc5GbjP8YpR
	XUiSI++3OpEjo+PgwvaZWgZ47ubBRrO0zYQf5rPk+RfMp4M=
X-Google-Smtp-Source: APiQypIlNEggEGfUrT0U3doTTjUbljPr7DBCbNlUQ8vXRbZMIPphad/Op76J9L44pVxaXApxgzWUN8TQzPvz6bmncLc=
X-Received: by 2002:a9d:6295:: with SMTP id x21mr13414796otk.291.1587871198346;
 Sat, 25 Apr 2020 20:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <1609386B276C754D.21337@lists.openembedded.org>
In-Reply-To: <1609386B276C754D.21337@lists.openembedded.org>
From: "Michael Halstead" <mhalstead@linuxfoundation.org>
Date: Sat, 25 Apr 2020 20:19:47 -0700
Message-ID: <CADfgfoZVOwX_0eeRDJAB0CSoAKxJOt3c63FWJh+a85=fTUJ7PA@mail.gmail.com>
Subject: Re: [OE-core] Brief git.openembedded.org Downtime
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ba12c205a42912ec"

--000000000000ba12c205a42912ec
Content-Type: text/plain; charset="UTF-8"

This work is complete and all services are available. As a bonus the new
hardware is faster.

Service restored at 2020-04-25 20:14 PDT.

On Sat, Apr 25, 2020 at 5:52 PM Michael Halstead via lists.openembedded.org
<mhalstead=linuxfoundation.org@lists.openembedded.org> wrote:

> There is a potential issue with the physical machine hosting
> git.openembedded.org. I'm going to take the VM offline to move it to new
> hardware. The process should take less than 30 minutes.  Full backups have
> been taken in case of unexpected failures.
>
> The downtime will begin in about 2 hours starting at 2020-04-25 20:00 PDT.
> I will e-mail when the process is complete.
>
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>
>
> 
>


-- 

-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000ba12c205a42912ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This work is complete and all services are available. As a=
 bonus the new hardware is faster.<div><br></div><div>Service restored at=
=C2=A02020-04-25 20:14 PDT.</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 25, 2020 at 5:52 PM Michael H=
alstead via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;mhalstead=3D<a href=3D"mailto:linuxfoundation.org@lists.openembed=
ded.org">linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">There i=
s a potential issue with the physical machine hosting <a href=3D"http://git=
.openembedded.org" target=3D"_blank">git.openembedded.org</a>. I&#39;m goin=
g to take the VM offline to move it to new hardware. The process should tak=
e less than 30 minutes.=C2=A0 Full backups have been taken in case of unexp=
ected failures.<div><br></div><div>The downtime will begin in about 2 hours=
 starting at 2020-04-25 20:00 PDT. I will e-mail=C2=A0when the process is c=
omplete.<br><div dir=3D"ltr"><div dir=3D"ltr"><blockquote type=3D"cite" sty=
le=3D"color:rgb(0,0,0)"><pre></pre></blockquote><pre><div>--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

</div></pre></div></div></div></div>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote type=3D"cite" styl=
e=3D"color:rgb(0,0,0)"><pre></pre></blockquote><pre><div>--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

</div></pre></div></div>

--000000000000ba12c205a42912ec--
