Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T5uVi-0002GT-H2
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 10:17:26 +0200
Received: by wgbdr1 with SMTP id dr1so2672045wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=49mWORRx84jqlPhnnq7i9nWgczbW45n9TiWPcNbF7Is=;
	b=Md56Sd6vuhKWdS0MfabYqkJNmVYtvSeGpXV60Ll7MFEYxa7t4YOwqjknmH8dYOsr9i
	N0zywti+IG/79XamTf03Rqh1sIuvnODcyJ3YBWWkcY5/G1pnMRg2ri6JyS+Z3i74l5w5
	Hp81x/IcHN50xQ/nQMOAciCtSvDmv3YCMgB1hny1bgU+vanBVrkhx/2Vbs5e7BjmPwza
	jD0OyL9Cnuw/ozHXHqdbL+iVZspG5DNJLtNgT8ACp/hPz/XYabbBmeVLACuw9gQCuFiM
	AyYj97suRDK0DK+8MO+LmS6fcbYYG15hk+0fsta0ME2ruzCqa24FNpgrO1I/HyJ1KTEg
	oMaQ==
MIME-Version: 1.0
Received: by 10.180.96.3 with SMTP id do3mr23714077wib.5.1346054715432; Mon,
	27 Aug 2012 01:05:15 -0700 (PDT)
Received: by 10.216.133.32 with HTTP; Mon, 27 Aug 2012 01:05:15 -0700 (PDT)
Date: Mon, 27 Aug 2012 10:05:15 +0200
Message-ID: <CAOHjBZtdvx616YgP-HeXE6xFgrP0y42BJEfPh5r6uTRmoCYQnw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: How can I append .inc files?
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
X-List-Received-Date: Mon, 27 Aug 2012 08:17:26 -0000
Content-Type: multipart/alternative; boundary=f46d0444813529607304c83ac99c

--f46d0444813529607304c83ac99c
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

Is there a way to append (in private layer) the .inc files other than the
.bb (bbappend)?

Thanks,
Giuseppe

--f46d0444813529607304c83ac99c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>Is there a way to append (in private l=
ayer) the .inc files other than the .bb (bbappend)?</div><div>=A0</div><div=
>Thanks,</div><div>Giuseppe</div>

--f46d0444813529607304c83ac99c--
