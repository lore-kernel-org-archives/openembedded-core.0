Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id A4007766B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:57:41 +0000 (UTC)
Received: by lffu14 with SMTP id u14so16624788lff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 05:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wq3E65PqY93M54cnD5KAJ/N9uby3YcvbXO1bH4R0I6A=;
	b=f2/SvFobTJuIB7a3sU60ky6/BNac1nh+E/ohR0ytIB49JIF8dLWwMPMf9txvKPLKd/
	prxZhLFTkDwEBRrlD7jky9G0mLep8iUmaFiYB9iIUexvVuI7aG7N06SD7juQwZu9JtVM
	Vbm7lxeN4nMlfRh3zPKaBY8FyqFG4AnNYhMpyppgglWPhaRE0LXpVwKaRJQ3rErWYu6h
	CANUwXs8RG6wTT4C+XSAhSBXsqYKFlsyIa8+BWbOI6HpoFN3J0EOMGVPNV8K/nkZ9UW2
	gy4X4+NKU19UXe7IDcXUmQanc3NDIbjiiI1UrOE4zJ8ZBveSirJnvZfnegw3U08cYn7P
	3+Mg==
X-Received: by 10.25.160.213 with SMTP id j204mr4382442lfe.85.1447250260949;
	Wed, 11 Nov 2015 05:57:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.245.193 with HTTP; Wed, 11 Nov 2015 05:57:21 -0800 (PST)
In-Reply-To: <564348EE.6020604@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <56434723.5090605@linux.intel.com>
	<CAPybu_13B8Y8z4dZv0HgCHjHCpPX9oBu2+PNuew9bdYAD0JVbw@mail.gmail.com>
	<564348EE.6020604@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 11 Nov 2015 14:57:21 +0100
Message-ID: <CAPybu_2nRZX7XwSVBvSzEedBnpXJVoax2dv4OVAfP4kcGpeYZQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Wed, 11 Nov 2015 13:57:42 -0000
Content-Type: text/plain; charset=UTF-8

Hello Alexander



On Wed, Nov 11, 2015 at 2:55 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:

Unfortunately, my target arch is x86_64... I guess I could try to
solve the endless loop issue with the helper binary.

Regards!

>
> Alex



-- 
Ricardo Ribalda

