Return-Path: <kirgene@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2390771B2A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 18:45:38 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id w191so29600158wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=LXdAbKSPuN5JqV5t1TnQTinjVci8ElPC8coJCYvkgi4=;
	b=oqvnUgGlf53WE4io+HBq5rVwxJYx2W5gFzS4zvXFkqW72BuKVi4jTUd0Xw9nilgiGr
	uFnWYh6vQxGen2OK484OMebVYU7dybc/MgO75oZs0b6LCB1xLDZKs/ygP023cBptbk4u
	luwOoZ7MLTbtrPqHfP3imagpjbEO7KpmDj2OjaMax9unPqNsh9JoSG3EgakeuemGAliv
	eBJXmYi35Min4XGFNhbFyPc+xQlqjgba8PZGkpYTbznCXCt1PJS5obdpFuPV5fCKPstV
	VBY4kl+Qbfa+73c3WhYhE8W/ExDgvrqyUenGSzzTpMOks9lOOQsXVIaZstBdJxR6hpuL
	TBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LXdAbKSPuN5JqV5t1TnQTinjVci8ElPC8coJCYvkgi4=;
	b=MsCqdcHfdEeiTMtPJrJ49CSdjVvJmDTaOcnDyHF7n5kfw2gcqu2eVkfD5C3EIqprBL
	/DVLxTVH2E4sQ5fId8emsUgvLLQIibLiB1NAmfMR5DZpx7vcSKavwU+xGo1FkW7NkwxN
	QjrSq3F+F5cBEA2fvS9rRp/+8A2oR1NzIgYOuFu35wSow1laPxp6ttXyIqnVYtS/hOd6
	ZL+ENECI/wz+EnqfnLvtO4derDkM1js5HtKFsVcFOzQjk1f7crPC/rlj69eo5QJSEvo3
	wyXUILCoSaxMkyjLqmrOoAZguX7KnGk8+hhtEgAJp8ebXyGNyDrJrDJfcNXOpiwoN6nb
	IFGw==
X-Gm-Message-State: AIVw1123gB/bSqiEt6khA5KjmHHrbKAqdLWGujzSeqQjJVniuHYIy7dB
	vGNr2vuPDc0ikskFBvJWzCsT8rZ+jzxd
X-Received: by 10.28.181.18 with SMTP id e18mr1656114wmf.157.1500749139548;
	Sat, 22 Jul 2017 11:45:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.158.12 with HTTP; Sat, 22 Jul 2017 11:45:38 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
Date: Sat, 22 Jul 2017 21:45:38 +0300
Message-ID: <CADV-EXHdSir+kQG-N=2Fy_yOqWQW69oHTCy6QxD86Ve9RMmiFA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Update meta-qt5 to v5.9.1
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
X-List-Received-Date: Sat, 22 Jul 2017 18:45:39 -0000
Content-Type: multipart/alternative; boundary="001a1148e47c5c23ef0554ec63ce"

--001a1148e47c5c23ef0554ec63ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Qt 5.
=E2=80=8B9.1=E2=80=8B
has been released. Please update meta-qt5 accordingly.

--001a1148e47c5c23ef0554ec63ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small">Qt 5.<div class=3D"gmail_default" style=
=3D"display:inline">=E2=80=8B9.1=E2=80=8B</div> has been released. Please u=
pdate meta-qt5 accordingly.</div>
</div>

--001a1148e47c5c23ef0554ec63ce--
