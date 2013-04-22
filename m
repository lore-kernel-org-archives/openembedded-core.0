Received: from mail-qe0-f51.google.com ([209.85.128.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUGqo-0005Xm-6m
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 15:32:12 +0200
Received: by mail-qe0-f51.google.com with SMTP id 1so4038270qec.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=YJ+WNn/X+bhpYP0073CWsu8o1auX4/aW1ViCjGnDDvo=;
	b=R6AAyE7e6i2+n081ECkL9JvJ5HjYRUZSDpQJ3wbTEcVybOhR041WJztvv5pXxjmamw
	YwKxj9Ph6HBER/7lJoATYnRAr1eiX83aSxugO7sBX23Aqe14gxxSB6cbhunRYKRkfonw
	e/7dG/rug6fhwCetucM3nZT6zaKFRzvbvOn9A14Ru2Iqb0fNrTQMui4//idRdKPuYYG4
	6EsWlq9b1kaiMZBrIzAmhWkmF/dTfBp/advRv9v5Z5sEOtfho4/ELRiKXyv2VEsUzt5s
	Vo7uHd3rqwShgjnk0jvrgUszRVJER7K4kT+djpoEXn15aKdJZi8gs4KBwBFz2QWDgcRZ
	1Zpw==
MIME-Version: 1.0
X-Received: by 10.224.44.2 with SMTP id y2mr21701829qae.7.1366636470900; Mon,
	22 Apr 2013 06:14:30 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Mon, 22 Apr 2013 06:14:30 -0700 (PDT)
Date: Mon, 22 Apr 2013 16:14:30 +0300
Message-ID: <CADV-EXGNZgnsD6wXM2AFLANZ43G4hpP2BL0=Kys5JnbAh88Gzg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Embed initramfs into kernel
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
X-List-Received-Date: Mon, 22 Apr 2013 13:32:12 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8882629e8c04daf2d9a7

--047d7bdc8882629e8c04daf2d9a7
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I have a custom kernel recipe and initramfs image recipe.
How can I embed initramfs into kernel?
Is there any example available?

Best regards,
Yevhen

--047d7bdc8882629e8c04daf2d9a7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Hi!</div><div style><br></div><div style>I have=
 a custom kernel recipe and initramfs image recipe.</div><div style>How can=
 I embed=A0initramfs into kernel?</div><div style>Is there any example avai=
lable?</div>
<br clear=3D"all"><div>Best regards,<br>Yevhen</div>
</div>

--047d7bdc8882629e8c04daf2d9a7--
