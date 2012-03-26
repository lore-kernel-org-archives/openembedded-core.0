Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1SCGcN-0006BQ-UH
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 22:34:20 +0200
Received: by vcbfl13 with SMTP id fl13so5403685vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 13:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=gc27Mr3RwHejFGDy8OoHMQE0tbKbpwR+21NCbhfB2y0=;
	b=WB7pqKTLoTncy7g9+vF+1bdza6pkwnh61M18xtgpgClaa7NIzxpklvIib+SOX+60tY
	iu1w7vq7+8Tb21oIOuKIKdb1OwGAdQneb7hOuwi4+7IKeFXZmF7QvBdLRf+sFTpZnDZE
	TkbXkg9xIVqPT2dgWv0bePW8myHGgzQtG0gM/HDbicH53OMcPkfiTYoDYa+Sj2qS+A+K
	NFZaINa1C9YzEtpJCCuHxnPPMYYlYnOn8N36wZJSUYtE8vewdI3RlwVEDebRjgl983Iu
	bIdrQKXR3LBCnsuR0nqaV2yQYn2aIwH0zur+a/chM6PGWplYDeKdD5FLuDyLEQeLP34X
	XLCg==
MIME-Version: 1.0
Received: by 10.220.115.130 with SMTP id i2mr10662524vcq.72.1332793519297;
	Mon, 26 Mar 2012 13:25:19 -0700 (PDT)
Received: by 10.52.116.99 with HTTP; Mon, 26 Mar 2012 13:25:19 -0700 (PDT)
X-Originating-IP: [209.6.42.115]
Date: Mon, 26 Mar 2012 16:25:19 -0400
Message-ID: <CA+b4E8yygK0_d1YkXn3_DdbkOb-L6-8pC1h9ojVTi3m8UasRzg@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkL9PYPZAjdsupkpY0GNzyh5ZtVjVlUd6ueYr+X/kEIk/CuA1jlJvaiGsJ8/NGvdTkDlcsR
Subject: Stable release of oe-core
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
X-List-Received-Date: Mon, 26 Mar 2012 20:34:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,

I don't see an RC branch or anything like that in the git repo. I'm
about to make the leap from the oe classic 2011.03-maintenance branch
to oe-core, so I'm trying to figure out the right place to land.

In the March 13, 2012, OE TSC minutes, I noticed this text:
  c. oe-core release
=A0 =A0 =A0 feature freeze in 1 week
=A0 =A0 =A0 final freeze 2-3 weeks from=A018=A0Mar

Do I just need a little patience?

Cheers,
Brandon
--
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA


