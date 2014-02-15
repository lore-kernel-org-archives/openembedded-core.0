Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 69E7B6EC51;
	Sat, 15 Feb 2014 21:40:14 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rr13so13697287pbb.21
	for <multiple recipients>; Sat, 15 Feb 2014 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=Z33MTdrIBHHKUBtYXfTSZslqv99y2es0PvfcSc8Mh7w=;
	b=WdSBl1EEz00BY1Od14kwwsxD4/WKTl0oG4teaBMQKIWX7oW/vInMOQNXvMfKQCZDKr
	DNXXyc4Yyxveq/Mi+FSYV6zGxKNZsW5HVdXopt8wt19gEW3uj/OUffR7X8GrjKisTpMq
	ruQaHdmh6/akQy9Lx55tnCzcUu8NQ8CJVwU2wr+GpsVl3KjK1RznXF8r5jCN3AfGUCb2
	dgD+zBSu+y69WkYyumIloym9qZjYnrywpO/xE73OxW0CFcUphHu+nDUy+EJRch9MylkB
	+v1eCvxhuwXYyceYkMQYUje35K2TP/X3A6rbEnWW0sJ/6ZS0nmSFLQt8alaFps129TOc
	dL9A==
X-Received: by 10.68.139.100 with SMTP id qx4mr17158789pbb.144.1392500415088; 
	Sat, 15 Feb 2014 13:40:15 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id vf7sm30289525pbc.5.2014.02.15.13.40.13
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Feb 2014 13:40:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMKF1srght3j6YgXJq-f+pzCnRCbWTEVuxuss5KjPthUaq+JTg@mail.gmail.com>
Date: Sat, 15 Feb 2014 13:40:11 -0800
Message-Id: <FEBAFA47-8E03-4C04-AF2A-D06F269E77D2@gmail.com>
References: <CAMKF1srght3j6YgXJq-f+pzCnRCbWTEVuxuss5KjPthUaq+JTg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Yocto list discussion <yocto@yoctoproject.org>
X-Mailer: Apple Mail (2.1827)
Subject: Re: Upcoming Bug blitz weekend ( Feb 21 - Feb 24)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Feb 2014 21:40:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Fellow Developers,

Here I would like to remind us all that bug squash weekend is coming. In =
addition to the bugs mentioned in bugzilla, if you are interested to fix
bugs in other layers besides OE-Core then there are some world build =
failures recorded on OE wiki

http://www.openembedded.org/wiki/Bitbake_World_Status

The links to failures logs are towards the end in above document.

Thanks
-Khem


On Feb 5, 2014, at 9:21 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi All
>=20
> I would like to invite everyone to the bug fixing weekend which is
> coming in 3 weeks from Feb 21 to Feb 24
>=20
> Bugs in NEW status for OE-Core & related categories:
>=20
> http://tinyurl.com/pu8vlaf
>=20
> All bugs/enhancements in NEW status in interesting categories:
>=20
> http://tinyurl.com/pjhrpwr
>=20
> Please feel free to pick any of the bugs which you are interested in
> and has no owner assigned to it
> or no one committed to it in comments or so. If there is a doubt
> please add a comment to bug or send email to existing assignee to
> coordinate your fix.
>=20
> Please assign the bugs to yourself beforehand and set the status to =
ACCEPTED
>=20
> This is a potential list but not exhaustive, you are free to pick any
> bugs that are not listed here
> and fix them,
>=20
> I also think it will be good to utilize IRC channel during the bug
> blitz weekend for communicating
> to supplement emails and mailing list communications
>=20
> I will send the reminders of the event as we come close to it.
>=20
> Looking forward to it
>=20
> -Khem


