Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFRxR-0002mI-EZ
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 16:45:00 +0200
Received: by pzk33 with SMTP id 33so6082432pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2011 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=gSZjyiXdZk9cW5iYvUmfj0Un/mpYAIQXdqXrI0ob4h8=;
	b=Te4m/XlBDTIIsd271awAgH1CzjvcpARmKSd8sYoUh8Rr8qBAiWb1EWg2h81iRJML9y
	WFdDv2RNcGQukiKEnCwhk//Qzw+7FU+2/ZAjCqrVwYw+dzW5TW0VadO55gQln3Z/lZa2
	p+X5c/az8dy4LaTN4pcQyE0oyKkU9AaMmV8o4=
Received: by 10.68.17.225 with SMTP id r1mr31775636pbd.64.1318775944641; Sun,
	16 Oct 2011 07:39:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Sun, 16 Oct 2011 07:38:15 -0700 (PDT)
In-Reply-To: <223029be8e7e53ae4d7ddbca8169289250cb921f.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
	<223029be8e7e53ae4d7ddbca8169289250cb921f.1318751027.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Oct 2011 07:38:15 -0700
Message-ID: <CAMKF1sqsz0_tm-mHNoREA6VXFTM7L6CGD-5woR=13h=RX30uJg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 01/14] bind: update to 9.8.1
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
X-List-Received-Date: Sun, 16 Oct 2011 14:45:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 16, 2011 at 12:46 AM, Saul Wold <sgw@linux.intel.com> wrote:
> =C2=A0LICENSE =3D "ISC"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dfe11ac92dcbd84134d91b6e2c2e=
ccab5"
> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D0fbe2a3ab3c68ac3fea3cad1309=
3877c"
>

why did this checksum change some words in commit would be nice


