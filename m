Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 23277757C4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:14:55 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so10011179qko.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 07:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bQ1+ITIrZ4Zn+IKN6FghRzqMI0nBsCZ2xBkDS0sqIPY=;
	b=XGhHNIHExNvcx5q1B49GAlnx9aJkyDxGM4ZleBMGb1SxFkjT9tRQNWhGSXnYDHTVTT
	BMHLnYv16ODUDgwnWgNa6HusRpn9CMlm7dZ32yLR+dxE+O0ndpIthythDmmXAEqxfQjO
	6q60tptVkV+ibJUXXZK3wqOIQjvRmNhFJfeLrbQzJmrr2/SHqw7DUu8a9Bbt6g01njPA
	J5+w5sC6IVwPrwyNgzFerbp5Iu816YX1DkxUaDziUkIPR6wp/H7xGKJ5QLKLTBNEKK1V
	BlnSngrgrOk0tkzce5SfnI0G+WZVyQDgjmmUzoo0lqRgz0L+3UDgkP7mxkMvDNtjlQxi
	WXNA==
X-Gm-Message-State: ALoCoQkmJWiz03DzBEPg0Y7KqQvuNtXpnrVu4W5mFgTeMQjvXCNCZhT/ju5T75CvzdK2kbH8KwEd
X-Received: by 10.140.235.195 with SMTP id g186mr27946018qhc.64.1433859296890; 
	Tue, 09 Jun 2015 07:14:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 07:14:36 -0700 (PDT)
In-Reply-To: <1433856907-30102-2-git-send-email-moritz.blume@bmw-carit.de>
References: <1433856907-30102-1-git-send-email-moritz.blume@bmw-carit.de>
	<1433856907-30102-2-git-send-email-moritz.blume@bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 15:14:36 +0100
Message-ID: <CAJTo0LaM0vJuChBA=cTfj888w9-bwTZ8t-coMdG4Fd+hk=N4Gw@mail.gmail.com>
To: Moritz Blume <moritz.blume@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Tue, 09 Jun 2015 14:14:57 -0000
Content-Type: multipart/alternative; boundary=001a11354c8a0ca94605181662d5

--001a11354c8a0ca94605181662d5
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 14:35, Moritz Blume <moritz.blume@bmw-carit.de> wrote:

>  PR = "r1"
>

You can drop the PR line as the PV is increasing.

Ross

--001a11354c8a0ca94605181662d5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2015 at 14:35, Moritz Blume <span dir=3D"ltr">&lt;<a href=3D"mail=
to:moritz.blume@bmw-carit.de" target=3D"_blank">moritz.blume@bmw-carit.de</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=C2=
=A0PR =3D &quot;r1&quot;<br></span></blockquote></div><br>You can drop the =
PR line as the PV is increasing.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a11354c8a0ca94605181662d5--
