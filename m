Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1QKoRG-0006Ww-90; Fri, 13 May 2011 11:13:38 +0200
Received: by ewy5 with SMTP id 5so685516ewy.6
	for <multiple recipients>; Fri, 13 May 2011 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=MbxOXZYVmRHeaCc+WCsp8VNHI6IBGBstF46C58MNuAU=;
	b=STLNkH3WzMM5P0htB1mmNgfcSFBQoEjMNN/70XzWexg28OMJPxnu+nGjjt7UDFvVIa
	bwxGRvLdAzKZfAT2HxcZUftXkyQuyB2km+wMKxCnY6VG7xPX4tA+J+84ywT/IH+ln8Tt
	IKB7eW5hE1LN+g8lSPeNfDSGRgcDpcszu50Pc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=iHCq97sOxGmiCKJphxf+TTW009rakD/1WGtzngFa28x4l0awRhz2t3gU5evjGaFkz0
	cZmOBp2hkgCq8fqbO1au78oECrLtx7hguKDhf5ehDakoGml/gXYghrhnzNewtOnOohNy
	HZQLTouZ1fWGmFar55K8r+odI+rTEKRdvzjcY=
Received: by 10.14.0.133 with SMTP id 5mr514523eeb.144.1305277848215; Fri, 13
	May 2011 02:10:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Fri, 13 May 2011 02:10:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 May 2011 02:10:18 -0700
Message-ID: <BANLkTinm-YXGM0z1CFJamQG7N0Em442VHw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Mike Westerhof <mike@mwester.net>
Subject: Where to host new layers
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
X-List-Received-Date: Fri, 13 May 2011 09:13:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi Mike and all

I have created couple of layers namely meta-slugos (distro layer) and
meta-nslu ( machine layer). I was  looking for place to host those
layers. Would they be good under meta-openembedded ? I dont think
http://www.nslu2-linux.org/
has git infrastructure otherwise that would be one place to put it.

Thanks

-Khem


