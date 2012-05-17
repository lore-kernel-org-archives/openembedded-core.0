Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1SUyZt-00013T-Vz; Thu, 17 May 2012 13:09:06 +0200
Received: by pbbrq2 with SMTP id rq2so2141080pbb.6
	for <multiple recipients>; Thu, 17 May 2012 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=xOjJZrAMCWs3TBx3aC5gIeR8t41SntwxoEp1d1v/0xE=;
	b=Nkf84z1UCGbNPYMbH/v14HB5EhF0+dflpikEo39rlhejDKkuymVwcG71SE0ChyLH1w
	6cwtUaqt6HvCGkXFyiOWqkYo36wlb6bYI03Jab9BJeveBb6c1x8Bxc25Sz9gjQMMFE1o
	MlHyzWXEgytAbzcM4serXH+RFAjW+KRx4c1sNZM+ohDDw0qKYV5ylUzJu5tMQIzEuXUX
	f767L6kswptfu1tCWKr+c/7Dwg8oNEme7Bdc1+edyo/1gkheVXUbPT8jG7KWu+GhLrGq
	R1jpuJ1aQxaHNXk8kpyuAkc+v7eCCgUNFbhsXeZLLnxIMM/1P7PMJp/eIAxGgixucVN4
	EQjg==
MIME-Version: 1.0
Received: by 10.68.223.129 with SMTP id qu1mr26202768pbc.165.1337252342291;
	Thu, 17 May 2012 03:59:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.25.42 with HTTP; Thu, 17 May 2012 03:59:02 -0700 (PDT)
Date: Thu, 17 May 2012 07:59:02 -0300
X-Google-Sender-Auth: DGm8oC7Jp4UeYRpsz6TMUovepnI
Message-ID: <CAP9ODKq0aRL6--FcK6o5gaBbk5hE8-Pr8B4S0+V9yN5uKZk+aw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [ANNOUNCE] Meta-Broweser layer
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
X-List-Received-Date: Thu, 17 May 2012 11:09:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

Our friends at Eukrea has started working at a Chromium specific layer
and to share work in web browser packaging we opted to merge both
layers to host different web browser packages. After this the layer
has been renamed to /meta-browser/.

The meta-browser layer can be used by any project that needs to use
Firefox and/or Chromium; other browsers can be add to the layer if
need and it is open for contributions of any interested people.

The layer can be download from
https://github.com/OSSystems/meta-browser so please update your system
to use from now on.

We will REMOVE meta-mozilla and meta-chromium next week.

Thanks in advance :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


