Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TwkdQ-00059H-Bz
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 03:27:53 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so5079794lab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 18:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=D+4FaRUOM9vwS8nNQRLg3kbV2UFpyb2BeqLK53df2dM=;
	b=FI+/B9glJH0c9Ccmeaf5I7aVEh1ifn3z6XIiVflgP85GO9vEyhLkYdSAqfe5srLZ9V
	eKnhEvztbw0vSPPERXXjp6kXSWPIN6EQDUY7Mnudyvuv4RvuyvBN+waEszYZhxEwH1td
	+gBi5VQPLJ/QRMJ+1GawxYEhHAXAgQpNsJych3mwqtYRYEvNbsI3rS9G5049d9vfIgtN
	pNBYl78130mEw9/KgwMV5VaSVUW0tmfroWO2YBjRDbjWS9b8l4GjxShnXCBmINLgwd1p
	7Ykj/g7JWpgfVebKGW0kl0YkV1eSYBCd0ohJf9ar8Ftmzqhox9u4FwE4yFQjUbuLtlsv
	WzJQ==
X-Received: by 10.152.134.243 with SMTP id pn19mr13138017lab.11.1358647941413; 
	Sat, 19 Jan 2013 18:12:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.34.10 with HTTP; Sat, 19 Jan 2013 18:12:00 -0800 (PST)
In-Reply-To: <50FA28CD.3090300@linux.intel.com>
References: <cover.1358281118.git.chris_larson@mentor.com>
	<5cb12f38b2ac74ea118b58888a0c37f63917fbfa.1358281118.git.chris_larson@mentor.com>
	<50FA28CD.3090300@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Sat, 19 Jan 2013 19:12:00 -0700
Message-ID: <CABcZANku=GCN0RDN-zBVdXig0CJbe-yLN+iYF+1N+BnJRu9qhg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] base.bbclass: improve the incompatible license logic a bit
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
X-List-Received-Date: Sun, 20 Jan 2013 02:27:56 -0000
Content-Type: multipart/alternative; boundary=f46d04427248ec3aa104d3aedf61

--f46d04427248ec3aa104d3aedf61
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 18, 2013 at 10:02 PM, Saul Wold <sgw@linux.intel.com> wrote:

> Can you please review this as we are closing m3 on Sunday Midnight.
>

Heh, looks like nobody ever really exercised the package exclusion code.
I'll take a look sunday morning if need be.
-- 
Christopher Larson

--f46d04427248ec3aa104d3aedf61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Jan 18, 2013 at 10:02 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1jn">Can you please review this =
as we are closing m3 on Sunday Midnight.<br></div></blockquote></div><br>He=
h, looks like nobody ever really exercised the package exclusion code. I&#3=
9;ll take a look sunday morning if need be.<br>

-- <br>Christopher Larson</div></div>

--f46d04427248ec3aa104d3aedf61--
