Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1RXx0I-0003KF-Au
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 16:32:22 +0100
Received: by qcqw6 with SMTP id w6so2308494qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 07:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=GiTaLsTaQNVpyoHHUiMGxL+VTaEqjksrLXcKDrl6LXw=;
	b=hKhm7k2T13AZQ6GzVuEHGmE9NBGKl8XViQZkOOJCPSZ/Vu1hBE6XK3rdMbmEuI6GH1
	4OFgjz55LEQpYYXNhY4aMu4y/wUwb21tYjzFHEiUBo2ajsWpKn8R/kCOaUdPQDcHW8Sj
	7TUbGL4UxabNkVgArr8HE0w6qnUqtZVZwyDek=
MIME-Version: 1.0
Received: by 10.182.118.67 with SMTP id kk3mr2761798obb.27.1323185133550; Tue,
	06 Dec 2011 07:25:33 -0800 (PST)
Received: by 10.182.5.163 with HTTP; Tue, 6 Dec 2011 07:25:33 -0800 (PST)
Date: Tue, 6 Dec 2011 18:25:33 +0300
Message-ID: <CAFZPMobk7jE4nQjB81i_nvo3cjumrGmMEH4A+TfBoC=SZr8=6Q@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: building SDK
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
X-List-Received-Date: Tue, 06 Dec 2011 15:32:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, all!

Is it known how to build custom SDK with current OE-core based build system?
Also how to put basic toolchain into device image?

Thanks a lot,
S.


