Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1STdsb-0006WY-0e
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 20:50:53 +0200
Received: by obhx4 with SMTP id x4so6967474obh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zwe4ucUKW76DuZvqmSUOYV0YkGwrGZIRqx9rhGc7IfY=;
	b=c+c0ulGSZj51U8HrTtQPG66H6VdWZVEMJXhtAlSNDd0/T3BliQEErn4iqma+Sxm9Lq
	xaSlhvbqX9RCwtuzCfF8RCfPOJphEADjqb27y1fYPXzkueG50xf9+lgR/NXSriBzKis3
	aEXolqJb7Gw7yx2CJQZqB2bkECFWI3keLacHYvqPL788ZTPpMTMVZmjsIxPutdCuWxhK
	bkFk88nT/V3IAVys/TLVdSAw7/1xHs9Cwzd0brFkoi4IhH2eu7lWOpeXd0DACAEmpNSB
	2Pr/QADMVIoB75n7kK8NJuoJeel2GEPItZMMA/3WloD90jjHpF3c7bfPVO7ZuzdcI5eM
	WokA==
MIME-Version: 1.0
Received: by 10.50.100.226 with SMTP id fb2mr1230950igb.31.1336934454419; Sun,
	13 May 2012 11:40:54 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Sun, 13 May 2012 11:40:54 -0700 (PDT)
In-Reply-To: <1336934223-12734-1-git-send-email-cazfi74@gmail.com>
References: <1336934223-12734-1-git-send-email-cazfi74@gmail.com>
Date: Sun, 13 May 2012 21:40:54 +0300
Message-ID: <CAF6bG8d3YOgwT3eUbxSKVmEbyMRVqK1LXk8wKBhKrQo+4Bv9dA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg: update to upstream version 8d
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
X-List-Received-Date: Sun, 13 May 2012 18:50:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 May 2012 21:37, Marko Lindqvist <cazfi74@gmail.com> wrote:
> * Have README as license file instead of several source files that just
> =C2=A0refer to it

 This could have been separate patch before update one - old version
(8c) had license information same way as new one, and recipe listed
files that just contained "For conditions of distribution and use, see
the accompanying README file." as license files.


 - ML


