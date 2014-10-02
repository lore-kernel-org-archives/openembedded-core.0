Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 819A86FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:40:54 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 200so993263ykr.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 00:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=0G95RN6Swuj6fV48FAts21M2tGHT2VoD05wt5qF7Huk=;
	b=C5aiju2M1zwBVtn7nAl3hTOIebl00hD85rE2tNdRAluIRaenG+ClM6A7bL6NIvSxCR
	rptEtH8WnOO2/Zk/8ywVIetqBbqvAz2dPJ0CswXVXTdiQvdtGEEcO9IOCW1ASVEMoWcx
	T8TmKlQkcjPAnOqsX33IGxMX92FI3+5xYOIZ25zLk4aGCh6ZKyiSOa1y0ZNxgM3uLMCj
	bnjkT8wYS9RPpFKUPWkZAaQjxIPVx//WMTcK4SwsAJGTE3QPLIEy3aKlGeD1NB5jkWgh
	m+VlOXZu6sc3cryhK9A/j6BAhVi/EFMcw6Ca3GxY+3URGJ7Kt1fliqpjLlI0gCrbCUgw
	1qSQ==
MIME-Version: 1.0
X-Received: by 10.52.68.102 with SMTP id v6mr31765677vdt.8.1412235655328; Thu,
	02 Oct 2014 00:40:55 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Thu, 2 Oct 2014 00:40:55 -0700 (PDT)
Date: Thu, 2 Oct 2014 09:40:55 +0200
Message-ID: <CALbNGRT+5fs=_KTNkkVc9VUSD_dLWOsyddEAsT_juXLNOm=Ahw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: xf86-video-fbdev "FBIOPUTCMAP: Invalid argument" problem
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
X-List-Received-Date: Thu, 02 Oct 2014 07:41:01 -0000
Content-Type: multipart/alternative; boundary=001a1136b2b693373705046bbcd0

--001a1136b2b693373705046bbcd0
Content-Type: text/plain; charset=UTF-8

Hi,

After a while of absence for other projects I built my standard image (xfce
based for gumstix). When starting xserver I see lots of

(EE) FBDEV(0): FBIOPUTCMAP: Invalid argument

Anybody out there with similar experiences or even better ideas to solve?

Andreas

--001a1136b2b693373705046bbcd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>After a while of absence for other project=
s I built my standard image (xfce based for gumstix). When starting xserver=
 I see lots of<br><br>(EE) FBDEV(0): FBIOPUTCMAP: Invalid argument<span cla=
ss=3D"sew3cc0m2qtlh0y"></span><span class=3D"sew3cc0m2qtlh0y"></span><br><b=
r>Anybody out there with similar experiences or even better ideas to solve?=
<br><br></div>Andreas<br></div>

--001a1136b2b693373705046bbcd0--
