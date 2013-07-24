Return-Path: <giuseppe.condorelli@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id A5814605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 07:33:33 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ef5so12473514obb.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 00:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oRxkFQscYpMM/n0SLf2Q7dG5nKxuHNAsEVs8UFPNEkM=;
	b=ugOj+OjwuN6udTpxarm8gpnJulVIAwWLkxDDfiPUNsMh7VapKyCkVYnYf/qeRx3VGW
	AQqH2k8ZcCKZZDWkW438Nx7c6N6ovgOLl9o4SB5cI+pUEkCnbDcDQsyX+gk5bHQ4EDV1
	H6ErCg9b3QKr84XSCqjEUi5yi7ha13gt8rESrql1DMXNktTD12yLwuXp6cSlnQSr5YJR
	zY0gIZ66NgBQ9nz56YJ8ikPUlxMkSo1mueijE10vpmRMCW/EIGZtjVQDiLinLzg7avUQ
	s6J6I4uo6IGMQtyCQbKa4pJd7dpSWy7bbegI2VFQlU/kBV8s6Nij7l3GJ7sGmeAaVqCK
	uTKA==
MIME-Version: 1.0
X-Received: by 10.60.132.230 with SMTP id ox6mr34785742oeb.66.1374651213309;
	Wed, 24 Jul 2013 00:33:33 -0700 (PDT)
Received: by 10.182.142.65 with HTTP; Wed, 24 Jul 2013 00:33:33 -0700 (PDT)
Date: Wed, 24 Jul 2013 09:33:33 +0200
Message-ID: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Wed, 24 Jul 2013 07:33:34 -0000
Content-Type: multipart/alternative; boundary=047d7b41cbb8426db304e23ced5f

--047d7b41cbb8426db304e23ced5f
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

given that the make v. 3.82 is broken, as the sanity check highlights,
which is the best solution
to allow Fedora users (as I am) to go ahead with the build?
I don't like to avoid sanity checks or to use an older version of
sanity.bbclass.
Please let me know, currently this issue is blocking for me.

Cheers,
Giuseppe

--047d7b41cbb8426db304e23ced5f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>given that the make v. 3.82 is broken,=
 as the sanity check highlights, which is the best solution</div><div>to al=
low Fedora users (as I am) to go ahead with the build?</div><div>I don&#39;=
t like to avoid sanity checks or to use an older version of sanity.bbclass.=
</div>
<div>Please let me know, currently this issue is blocking for me.</div><div=
>=A0</div><div>Cheers,</div><div>Giuseppe</div>

--047d7b41cbb8426db304e23ced5f--
